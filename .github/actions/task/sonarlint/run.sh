#!/bin/bash
ls -la
pwd
(
	cd source_code || exit
	sonarlint >../sonar_lint.log
)

# Extract the line with the number of issues
issue_line=$(grep -E "issue(s?) \(" sonar_lint.log)

# Extract the number of issues from the line
# Handles both singular and plural 'issue' words
# trunk-ignore(shellcheck/SC2312)
issue_count=$(echo "${issue_line}" | grep -oE '[0-9]+ issue(s?)' | grep -oE '[0-9]+')

cat sonar_lint.log
rm -f sonar_lint.log

# Check if there are any issues
if [[ ${issue_count} -gt 0 ]]; then
	echo "SonarLint found ${issue_count} issue(s)."
	exit 1
else
	echo "No issues found by SonarLint."
	exit 0
fi
