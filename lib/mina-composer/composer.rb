require 'mina-composer/helpers'

namespace :composer do
  extend MinaComposer

  desc "Install Composer bin at composer_path"
  task :install_bin do
    queue %{
      echo "-----> Installing Composer." && (
        #{echo_cmd %{cd #{get_composer_path}}} &&
        #{echo_cmd %{curl -s https://getcomposer.org/installer | php}} &&
        #{echo_cmd %{cd #{deploy_to}}} &&
        echo "------> Done."
      ) || (
        echo "! ERROR: Install composer failed."
        echo "! Ensure that the path '#{deploy_to}' is accessible to the SSH user."
      )
    }
  end

  desc "Self update composer"
  task :self_update do
    queue %{
      echo "-----> Updating composer to latest release" && (
        #{echo_cmd composer_cmd("self-update")} &&
        echo "-----> Done."
      ) || (
        echo "! ERROR: self update composer error."
      )
    }
  end

  desc "Install app dependency"
  task :install do
    queue %{
      echo "-----> Installing app dependency." && (
        #{echo_cmd composer_cmd("install")} &&
        echo "-----> Done."
      ) || (
        echo "! ERROR: Installing app dependency."
      )
    }
  end

  desc "Update app dependency"
  task :update do
    queue %{
      echo "-----> Updating app dependency." && (
        #{echo_cmd composer_cmd("update")} &&
        echo "-----> Done."
      ) || (
        echo "! ERROR: Updating app dependency."
      )
    }
  end
end