#
#
$poetryBin = (Get-Command 'poetry').Source

$poetryOptions = `
@(	'--ansi',
	'--help',
	'--no-ansi',
	'--no-interaction',
	'--quiet',
	'--verbose',
	'--version'
)

$poetryCommandOptions = `
@{
	about = @(

		)
	add = @(
		'--allow-prereleases',
		'--dev',
		'--dry-run',
		'--extras',
		'--lock',
		'--optional',
		'--platform',
		'--python',
		'--source'
		)
	build   = @(
		'--format'
		)
		cache   = @(
		
	)
	check   = @(
		
	)
	config  = @(
		'--list',
		'--local',
		'--unset'
	)
	debug   = @(
		
		)
		env     = @(
			
			)
			export  = @(
				'--dev',
				'--extras',
				'--format',
		'--output',
		'--with-credentials',
		'--without-hashes')
		help    = @(
			
	)
	init    = @(
		'--author',
    	'--dependency',
	    '--description',
		'--dev-dependency',
		'--license',
		'--name',
		'--python'
		)
		install = @(
		'--dry-run',
    	'--extras',
    	'--no-dev',
		'--no-root',
    	'--remove-untracked'
		)
	lock    = @(
		'--no-update'
		)
		new     = @(
			'--name',
    	'--src'
		)
		publish = @(
			'--build',
			'--cert',
			'--client-cert',
			'--dry-run',
			'--password',
			'--repository',
			'--username'
			)
			remove  = @(
				'--dev',
				'--dry-run'
				)
				run     = @(

					)
	search  = @(
		
		)
	self    = @(
		
		)
		shell   = @(
		
	)
	show    = @(
		'--all',
    	'--latest',
		'--no-dev',
		'--outdated',
		'--tree')
		update  = @(
		'--dry-run',
		'--lock',
		'--no-dev'
		)
		version = @(
		'--short'
		)
	}
	
function PyPoetryCompleter{
	param ( $commandName,
	$parameterName,
	$wordToComplete,
	$commandAst,
	$fakeBoundParameters )
	
    if ($fakeBoundParameters.ContainsKey('Command')) {
		$poetryCommandOptions[$fakeBoundParameters.Command] | Where-Object {
			$_ -like "$wordToComplete*"
        }
	}
	$poetryOptions | Where-Object {$_ -like "$wordToComplete*"}
}

function PyPoetryArgumentCompleter {
	[CmdletBinding()]
	param (
		[Parameter()]	
        [ArgumentCompletions(
			'about',
			'add',
			'build',
			'cache',
			'check',
			'config',
			'debug',
			'env',
			'export',
			'help',
			'init',
			'install',
			'lock',
			'new',
			'publish',
			'remove',
			'run',
			'search',
			'self',
			'shell',
			'show',
			'update',
			'version'
		)]
        $Command,
		
        # [Parameter(ValueFromRemainingArguments)]
		[Parameter(ValueFromRemainingArguments)]
		[string[]]
        [ArgumentCompleter({ PyPoetryCompleter @args })]
        $Options
		
		# $Remaining,
      )
	Write-Verbose $Command
	Write-Verbose ($Options -join ", ")
	Invoke-Expression "$poetryBin $Command $Options"

}

Set-Alias poetry PyPoetryArgumentCompleter