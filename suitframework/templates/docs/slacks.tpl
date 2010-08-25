<p>[gettext]<a href="[url controller="root" action="template" templatefile="slacks" /]">SLACKS</a> takes a SUIT generated log, which contains information on how the execute function works, and formats it to show the user how it transformed the template. In order to permit SLACKS to access this log, instead of calling execute and printing the result, you must use the following snippet.[/gettext]</p><fieldset id="php">    <legend class="yesscript" style="display: none"><a href="#null" id="phplink">[gettext]PHP - Click to toggle[/gettext]</a></legend>    <legend class="noscript">[gettext]PHP[/gettext]</legend>    [transform function="pygments" lexer="php"]<?php// Execute the string.$string = $suit->execute($rules, $string);// Check if POST or GET data have been sent for SLACKS.if ((array_key_exists('slacks', $_POST) && $_POST['slacks']) || (array_key_exists('slacks', $_GET) && $_GET['slacks'])){    // JSON encode the log.    $slacks = json_encode($suit->log);    // Set the headers to prompt a download of a .json file.    header('Pragma: public');    header('Expires: 0');    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');    header('Content-type: text/json');    header('Content-Disposition: attachment; filename=slacks.json');    header('Content-Length: ' . strlen($slacks));    // Print the log.    echo $slacks;}else{    // Print the string normally.    echo $string;}?>[/transform]</fieldset><fieldset class="noscript" id="python">    <legend class="yesscript" style="display: none"><a href="#null" id="pythonlink">[gettext]Python - Click to toggle[/gettext]</a></legend>    <legend class="noscript">[gettext]Python[/gettext]</legend>    [transform function="pygments" lexer="python"]# Execute the string.string = suit.execute(rules, string)# Check if POST or GET data have been sent for SLACKS.if 'slacks' in request.params:    # JSON encode the log.    slacks = json.dumps(suit.log, separators=(',', ':'))    # Set the headers to prompt a download of a .json file.    response.headerlist = [        ('Pragma', 'public'),        ('Expires', '0'),        (            'Cache-Control',            'must-revalidate, post-check=0, pre-check=0'        ),        ('Content-type', 'text/json'),        ('Content-Disposition', 'attachment; filename=slacks.json'),        ('Content-Length', len(slacks))    ]    # Print the log.    print slackselse:    # Print the string normally.    print string# Only include the following if this is running on a constant Python process.suit.log = {    "contents": [],    "hash": {},}[/transform]</fieldset>