function git_is_repo_private
  command \
    curl -s -H "Authorization: token <token>" https://api.github.com/repos/cdbattags/cdbattaglia-web | \
    rg -P "(^[\s|\t]+)(\"private\")(:\s)(\w+)(,)" -r '$4'
end
