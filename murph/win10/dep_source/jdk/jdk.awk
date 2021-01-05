/^https?:/ {
	if($0 ~ /zip$/) {
		if($0 ~ /hotspot/) {
			full_group =  group "/hotspot";
		} else if($0 ~ /openj9/) {
			full_group =  group "/openj9";
		} else if($0 ~ /java\/jdk/) {
			full_group =  group "/oracle";
		} else if($0 ~ /openjdk/) {
			full_group =  group "/openjdk";
		}
	} else {
		full_group =  group "/other";
		suffix_len = split($0, z, "\.")
		suffix = z[suffix_len]
	}
	filename_len = split($0, paths, "\/")
	filename = paths[filename_len]
	suffix_len = split(filename, names, "\.")
	suffix = names[suffix_len]
	sub("." suffix, "", filename)
	print "<item group=\"" full_group "\" suffix=\"" suffix "\" filename=\"" filename "\">" $0 "</item>"
}