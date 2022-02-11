
edit:completion:arg-completer[git-cliff] = [@words]{
    fn spaces [n]{
        repeat $n ' ' | joins ''
    }
    fn cand [text desc]{
        edit:complex-candidate $text &display-suffix=' '(spaces (- 14 (wcswidth $text)))$desc
    }
    command = 'git-cliff'
    for word $words[1:-1] {
        if (has-prefix $word '-') {
            break
        }
        command = $command';'$word
    }
    completions = [
        &'git-cliff'= {
            cand -c 'Sets the configuration file'
            cand --config 'Sets the configuration file'
            cand -w 'Sets the working directory'
            cand --workdir 'Sets the working directory'
            cand -r 'Sets the git repository'
            cand --repository 'Sets the git repository'
            cand --include-path 'Sets the path to include related commits'
            cand --exclude-path 'Sets the path to exclude related commits'
            cand --with-commit 'Sets custom commit messages to include in the changelog'
            cand -p 'Prepends entries to the given changelog file'
            cand --prepend 'Prepends entries to the given changelog file'
            cand -o 'Writes output to the given file'
            cand --output 'Writes output to the given file'
            cand -t 'Sets the tag for the latest version'
            cand --tag 'Sets the tag for the latest version'
            cand -b 'Sets the template for the changelog body'
            cand --body 'Sets the template for the changelog body'
            cand -s 'Strips the given parts from the changelog'
            cand --strip 'Strips the given parts from the changelog'
            cand --sort 'Sets sorting of the commits inside sections'
            cand -v 'Increases the logging verbosity'
            cand --verbose 'Increases the logging verbosity'
            cand -i 'Writes the default configuration file to cliff.toml'
            cand --init 'Writes the default configuration file to cliff.toml'
            cand -l 'Processes the commits starting from the latest tag'
            cand --latest 'Processes the commits starting from the latest tag'
            cand --current 'Processes the commits that belong to the current tag'
            cand -u 'Processes the commits that do not belong to a tag'
            cand --unreleased 'Processes the commits that do not belong to a tag'
            cand --topo-order 'Sorts the tags topologically'
            cand -h 'Prints help information'
            cand --help 'Prints help information'
            cand -V 'Prints version information'
            cand --version 'Prints version information'
        }
    ]
    $completions[$command]
}
