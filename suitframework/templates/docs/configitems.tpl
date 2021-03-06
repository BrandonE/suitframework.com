<p><em>[gettext]Available Since:</em> SUIT (2.0.0)[/gettext]</p>

<p>[gettext]Get the specified items from the config.[/gettext]</p>

<fieldset>
    <legend><a id="syntax" href="#syntax">[gettext]Syntax[/gettext]</a></legend>
    dict suit.configitems ( dict config, list items )
</fieldset>

<fieldset>
    <legend><a id="parameters" href="#parameters">[gettext]Parameters[/gettext]</a></legend>
    <fieldset>
        <legend><a id="config" href="#config">config</a></legend>
        <p>[gettext]The dict to grab from.[/gettext]</p>
    </fieldset>
    <fieldset>
        <legend><a id="items" href="#items">items</a></legend>
        <p>[gettext]The items to grab from the dict.[/gettext]</p>
    </fieldset>
</fieldset>

<fieldset>
    <legend><a id="returnvalue" href="#returnvalue">[gettext]Return Value[/gettext]</a></legend>
    <p>[gettext]The dict with the specified items.[/gettext]</p>
</fieldset>

<fieldset>
    <legend><a id="examples" href="#examples">[gettext]Examples[/gettext]</a></legend>
    <fieldset>
        <legend><a id="basicusage" href="#basicusage">[gettext]Basic Usage[/gettext]</a></legend>
        <fieldset id="php">
            <legend class="yesscript" style="display: none"><a href="#null" id="phplink">[gettext]PHP - Click to toggle[/gettext]</a></legend>
            <legend class="noscript">[gettext]PHP[/gettext]</legend>
            [transform function="pygments" lexer="php"][skip]<?php
require 'suit.class.php';
$suit = new SUIT();
$config = array
(
    'unclosed': False,
    'insensitive': True,
    'log': True,
    'mismatched': False,
    'escape': '\\'
);
$selected = $suit->configitems($config, array('escape'));
/*
Result: array
(
    'escape' => '\\'
)
*/
?>[/skip][/transform]
        </fieldset>
        <fieldset class="noscript" id="python">
            <legend class="yesscript" style="display: none"><a href="#null" id="pythonlink">[gettext]Python - Click to toggle[/gettext]</a></legend>
            <legend class="noscript">[gettext]Python[/gettext]</legend>
            [transform function="pygments" lexer="python"][skip]import suit
config = {
    'unclosed': False,
    'insensitive': True,
    'log': True,
    'mismatched': False,
    'escape': '\\'
}
selected = suit.configitems(config, ['escape'])
# Result: {
#     'escape': '\\'
# }[/skip][/transform]
        </fieldset>
    </fieldset>
</fieldset>

<fieldset>
    <legend><a id="seealso" href="#seealso">[gettext]See Also[/gettext]</a></legend>
        <ul>
            <li><a href="[url controller="root" action="template" templatefile="docs" parameter1="tokens" /]">[gettext]tokens[/gettext]</a></li>
            <li><a href="[url controller="root" action="template" templatefile="docs" parameter1="parse" /]">[gettext]parse[/gettext]</a></li>
        </ul>
</fieldset>