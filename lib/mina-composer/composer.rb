namespace :composer do

  task :install do
    install_path = deploy_to + '/' + shared_path
    queue %{
      echo "-----> Installing Composer." && (
        #{echo_cmd %{cd #{install_path}}} &&
        #{echo_cmd %{curl -s https://getcomposer.org/installer | php}} &&
        #{echo_cmd %{cd #{deploy_to}}} &&
        echo "------> Done."
      ) || (
        echo "! ERROR: Install composer failed."
        echo "! Ensure that the path '#{deploy_to}' is accessible to the SSH user."
      )
    }
  end
end