param([string]$Geo, [string]$Out)
$utf8 = New-Object System.Text.UTF8Encoding $false
$j = Get-Content $Geo -Raw -Encoding UTF8 | ConvertFrom-Json
# collect all rings (province polygons) as arrays of [x,y] in lon/lat
$rings = New-Object System.Collections.ArrayList
foreach ($f in $j.features) {
  $g = $f.geometry
  if ($g.type -eq 'Polygon') { [void]$rings.Add(@($g.coordinates[0])) }
  else { foreach ($p in $g.coordinates) { [void]$rings.Add(@($p[0])) } }
}
$minLon=999;$maxLon=-999;$minLat=999;$maxLat=-999
foreach ($r in $rings) { foreach ($pt in $r) { $lon=[double]$pt[0]; $lat=[double]$pt[1]; if($lon -lt $minLon){$minLon=$lon}; if($lon -gt $maxLon){$maxLon=$lon}; if($lat -lt $minLat){$minLat=$lat}; if($lat -gt $maxLat){$maxLat=$lat} } }
$W=1040; $pad=24; $cosLat=[math]::Cos(39*[math]::PI/180); $sx=($W-2*$pad)/($maxLon-$minLon); $sy=$sx/$cosLat; $H=[math]::Ceiling(($maxLat-$minLat)*$sy+2*$pad)
$px = { param($lon) ($lon-$minLon)*$sx+$pad }; $py = { param($lat) ($maxLat-$lat)*$sy+$pad }
# projected rings (simplified to >=1.2px steps) as double arrays
$proj = New-Object System.Collections.ArrayList
foreach ($r in $rings) {
  $xs = New-Object System.Collections.Generic.List[double]; $ys = New-Object System.Collections.Generic.List[double]
  $lx=-999; $ly=-999
  foreach ($pt in $r) { $x=(& $px ([double]$pt[0])); $y=(& $py ([double]$pt[1])); if ($xs.Count -gt 0 -and [math]::Abs($x-$lx) -lt 1.2 -and [math]::Abs($y-$ly) -lt 1.2) { continue }; $xs.Add($x); $ys.Add($y); $lx=$x; $ly=$y }
  if ($xs.Count -ge 4) { [void]$proj.Add(@{x=$xs; y=$ys}) }
}
# border path (dotted provinces)
$sb = New-Object System.Text.StringBuilder
foreach ($pr in $proj) { for ($i=0; $i -lt $pr.x.Count; $i++) { [void]$sb.Append(($(if($i -eq 0){'M'}else{'L'})) + [math]::Round($pr.x[$i],1) + ' ' + [math]::Round($pr.y[$i],1) + ' ') }; [void]$sb.Append('Z ') }
$borders = $sb.ToString().Trim()
# dot grid: point in any ring (even-odd per ring, union across rings)
$step = 9.0; $dots = New-Object System.Text.StringBuilder; $count=0
# precompute bbox per ring
$bb = @(); foreach ($pr in $proj) { $bb += ,@(($pr.x | Measure-Object -Minimum).Minimum, ($pr.x | Measure-Object -Maximum).Maximum, ($pr.y | Measure-Object -Minimum).Minimum, ($pr.y | Measure-Object -Maximum).Maximum) }
for ($gy=$pad; $gy -le $H-$pad; $gy+=$step) {
  $offset = if (([int](($gy-$pad)/$step)) % 2 -eq 0) { 0 } else { $step/2 }
  for ($gx=$pad+$offset; $gx -le $W-$pad; $gx+=$step) {
    $inside=$false
    for ($k=0; $k -lt $proj.Count -and -not $inside; $k++) {
      $b=$bb[$k]; if ($gx -lt $b[0] -or $gx -gt $b[1] -or $gy -lt $b[2] -or $gy -gt $b[3]) { continue }
      $xs=$proj[$k].x; $ys=$proj[$k].y; $n=$xs.Count; $c=$false; $jj=$n-1
      for ($i=0; $i -lt $n; $i++) { if ((($ys[$i] -gt $gy) -ne ($ys[$jj] -gt $gy)) -and ($gx -lt ($xs[$jj]-$xs[$i])*($gy-$ys[$i])/($ys[$jj]-$ys[$i])+$xs[$i])) { $c = -not $c }; $jj=$i }
      if ($c) { $inside=$true }
    }
    if ($inside) { [void]$dots.Append("M$([math]::Round($gx,1)) $([math]::Round($gy,1))h0 "); $count++ }
  }
}
$meta = @{ W=$W; H=$H; minLon=$minLon; maxLat=$maxLat; sx=$sx; sy=$sy; pad=$pad; dots=$count }
[System.IO.File]::WriteAllText("$Out\dotmap.borders.txt", $borders, $utf8)
[System.IO.File]::WriteAllText("$Out\dotmap.dots.txt", $dots.ToString().Trim(), $utf8)
[System.IO.File]::WriteAllText("$Out\dotmap.meta.json", ($meta | ConvertTo-Json -Compress), $utf8)
"rings: $($proj.Count); dots: $count; size: $W x $H; borders chars: $($borders.Length)"
