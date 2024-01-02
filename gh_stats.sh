#!/usr/bin/env bash
# https://github-readme-stats-qe6cs40i2-mb6ockatf.vercel.app/api/top-langs/?
# username=mb6ockatf
# &count_private=true
# &show_icons=true
# &hide_border=true
# &layout=compact
# $cache_seconds=8640
# &langs_count=100
# &theme=merko
url="https://github-readme-stats-qe6cs40i2-mb6ockatf.vercel.app/api/top-langs/?"
readonly NUMBER_RE="re='^[0-9]+$'"
repeat_char() {
	for ((i = 1; i < $2; i++)); do
		echo -n "$1"
	done
}

usage() {
	local name="${BASH_SOURCE[-1]}"
	cat << end_of_message
Open GitHub user language stats

USAGE
- show this message (default)
	$name [-h, --help]
- provide GitHub username (required)
	$name [-u | --username] username
- check whether private repositories should be included (true/fase)
	$name [-c | --count_private] boolean
- choose whether hide card border or not
	$name --hide-border
	$name --no-hide-border
- change card layout. possible options can be viewed with --show-layouts flag
	$name [-l | --layout] layout
- show all possible layouts
	$name --show-layouts
- choose for how long cached card should be stored
	$name --cache-seconds seconds
- choose how many languages to display
	$name --langs-count number
- choose card theme. possible themes can be viewed with --show-themes flag
	$name --theme theme
- show all possible themes
	$name --show-themes
$(repeat_char - 80)
mb6ockatf, Tue 02 Jan 2024 05:54:07 PM MSK
last updated: Tue 02 Jan 2024 05:54:19 PM MSK
end_of_message
}

contains() {
	[[ "$1" == *"$2"* ]] && echo 'yes' || echo 'no'
}

readonly ALLOWED_THEMES="default transparent shadow_red shadow_green
shadow_blue dark radical merko gruvbox gruvbox_light tokyonight onedark cobalt
synthwave highcontrast dracula prussian monokai vue vue-dark shades-of-purple
nightowl buefy blue-green algolia great-gatsby darcula bear solarized-dark
solarized-light chartreuse-dark nord gotham material-palenight graywhite
vision-friendly-dark ayu-mirage midnight-purple calm flag-india omni react
jolly maroongold yeblu blueberry slateorange kacho_ga outrun ocean_dark
github_dark_dimmed discord_old_blurple aura_dark panda noctis_minimus cobalt2
swift aura apprentice moltack codeSTACKr rose_pine catppiccin_latte
catpuccin_mocha date_night one_dark_pro rose holi neon blue_navy calm_pink
ambient_gradient"
readonly ALLOWED_LAYOUTS="compact donut donut-vertical pie"
readonly ALLOWED_COUNT_PRIVATE="true false"
username="mb6ockatf"
count_private="true"
readonly show_icons="true"
hide_border="true"
layout="compact"
cache_seconds="120"
langs_count="100"
theme="merko"
while [[ $# -gt 0 ]]; do
  case $1 in
	-h | --help) usage; exit ;;
	-u | --username) username="$2"; shift; shift;;
	-c | --count_private)
		_count_private="$2"
		if [[ $(contains ALLOWED_COUNT_PRIVATE "$_count_private") == "no" ]]
		then
			echo "such count_private value is not allowed"
			exit;
		fi
		count_private="$2"; shift; shift ;;
	--hide-border) hide_border="true"; shift ;;
	--no-hide-border) hide_border="false"; shift ;;
	-l | --layout)
		_layout="$2"
		if [[ $(contains ALLOWED_LAYOUTS "$_LAYOUT") == "no" ]]; then
			echo "such layout is not allowed"; exit;
		fi
		layout="$2"; shift; shift ;;
	--show-layouts) echo "$ALLOWED_LAYOUTS"; exit;;
	--cache-seconds)
		_cache_seconds="$2"
		if ! [[ "$_cache_seconds" =~ "$NUMBER_RE" ]]; then
			echo"cache_seconds must be a number"
			exit
		fi
		cache_seconds="$_cache_seconds"
		;;
	--langs-count) langs_count="$2"; shift; shift;;
	-t | --theme)
		_theme="$2"
		if [[ $(contains ALLOWED_THEMES "$_theme") == "no" ]]; then
			echo "such theme is not allowed";
			exit;
		fi
		theme="$2"; shift; shift;;
	--show-themes) echo "$ALLOWED_THEMES"; exit;;
	*) shift ;;
  esac
done
query="${url}username=${username}&count_private=${count_private}"
query+="&show_icons${show_icons}&hide_border=${hide_border}&layout=${layout}&"
query+="cache_seconds=${cache_seconds}&langs_count=${langs_count}"
query+="&theme=${theme}"
xdg-open "$query"
