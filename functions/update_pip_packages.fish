function update_pip_packages --description 'Update pip packages'
    set pip_outdate_pkgs (pip freeze | sed -e 's/=.*//g')
    for i in $pip_outdated_pkgs
        pip install --upgrade "$i"
    end
end
