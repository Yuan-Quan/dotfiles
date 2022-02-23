function catkinSource --on-variable PWD
    status --is-command-substitution; and return
    if test -e ".catkin_workspace"
        bass source devel/setup.bash
	set_color green
        echo -n "[catkin_fish]"
	set_color normal
	echo -n " sourced setup for current workspace"
	echo ""
	set -gx ws_dir "$PWD"
    end
end
