function fish_prompt

  if not set -q -g __fish_robbyrussell_functions_defined
    set -g __fish_robbyrussell_functions_defined
    function _git_branch_name
      echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    end

    function _is_git_dirty
      echo (git status -s --ignore-submodules=dirty ^/dev/null)
    end
  end

  set -l pink (set_color -o b48ead)
  set -l green (set_color -o 8FBCBB)
  set -l marine (set_color -o 5E81AC)
  set -l default (set_color -o 96BEC8)

  set -l circle "|"
  set -l cwd $marine(basename (prompt_pwd))

  if [ (_git_branch_name) ]
    if [ (_is_git_dirty) ]
      echo -n -s $cwd " " $pink $circle " " $default
    else
      echo -n -s $cwd " " $green $circle " " $default
    end
  else
    echo -n -s $cwd " " $marine $circle " " $default
  end



end
