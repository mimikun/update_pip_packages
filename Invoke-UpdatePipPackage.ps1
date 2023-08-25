function Invoke-UpdateCargoPackage() {
    $outdated_pkgs = pip freeze | ForEach-Object { $_ -replace "=.*", "" }
    foreach ($i in $outdated_pkgs) {
        pip install --upgrade $i
    }
}
