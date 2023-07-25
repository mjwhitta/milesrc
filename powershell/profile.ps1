set-alias -option allscope alias set-alias
function commandv {
    param($cmd)
    (get-command -erroraction silentlycontinue $cmd).source
}
set-alias -option allscope grep select-string
function gimme {
    $action = "install"
    $choco = commandv choco
    $nosave = $false
    $pkgs = [System.Collections.ArrayList]@()

    foreach ($arg in $args) {
        switch ($arg) {
            "-i" {$action = "install"}
            "-n" {$nosave = $true}
            "-R" {$action = "remove"}
            "-rn" {$action = "remove"; $nosave = $true}
            "-s" {$action = "search"}
            "-u" {$action = "update"}
            default {$ignore = $pkgs.Add($arg)}
        }
    }

    if ($choco) {
        switch ($action) {
            "install" {choco install -y $pkgs}
            "remove" {
                if ($nosave) {
                    choco uninstall -x -y $pkgs
                } else {
                    choco uninstall -y $pkgs
                }
            }
            "search" {choco search $pkgs}
            "update" {choco upgrade -y all}
        }
    } else {
        switch ($action) {
            "install" {winget install --id $pkgs}
            "remove" {
                if ($nosave) {
                    winget uninstall --purge $pkgs
                } else {
                    winget uninstall $pkgs
                }
            }
            "search" {winget search $pkgs}
            "update" {winget upgrade -r}
        }
    }
}
function grh {git reset --hard $args}
function gs {git status -bs $args}
function j {get-content -path "$HOME/.proj" | set-location}
set-alias -option allscope l more
set-alias -option allscope less more
function ll {get-childitem -force $args | sort-object}
function lsfunc {get-childitem -force -name $args | sort-object}
set-alias -option allscope ls lsfunc
function md5sum {get-filehash -algorithm md5 $args | select hash,path}
function pwdfunc {(get-location).path}
set-alias -option allscope pwd pwdfunc
function q {exit}
function save {(get-location).path >"$HOME/.proj"}
function sha256sum {get-filehash $args | select hash,path}
function sudo {start -verb runas powershell}
function unlock {
    $session=(quser $env:USERNAME | select -skip 1)
    $sid=(($session) -split "\s+")[2]
    start -argumentlist "tscon $sid /dest:console" -verb runas powershell
    exit
}
function update {gimme -u}
set-alias -option allscope vim nvim
set-alias -option allscope w quser
