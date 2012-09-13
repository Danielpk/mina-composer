module MinaComposer
  
  def get_composer_path
    settings.composer_path || "#{deploy_to}/#{shared_path}"
  end

  def get_composer_bin
    settings.composer_bin || "#{get_composer_path}/composer.phar"
  end

  def composer_cmd (cmd)  
    "php #{get_composer_bin} #{cmd} -n"
  end

end