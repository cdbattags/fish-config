# fetchenv
type -f fetchenv >/dev/null ^/dev/null
if test $status -eq 1
  echo 'installing fetchenv'
  npm i -g fetchenv
end

# greeting
function fish_greeting
  fetchenv
end
