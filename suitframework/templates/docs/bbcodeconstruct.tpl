<p><em>[gettext]Available Since:</em> Rulebox (1.0.0)[/gettext]</p>

<p>[gettext]Initialize a BBCode object to use <a href="[url controller="root" action="template" templatefile="download" /]#rulebox">Rulebox for PHP</a>.[/gettext]</p>

<fieldset>
    <legend><a id="syntax" href="#syntax">[gettext]Syntax[/gettext]</a></legend>
    obj new BBCode ( obj $suit, obj $templating )
</fieldset>

<fieldset>
    <legend><a id="parameters" href="#parameters">[gettext]Parameters[/gettext]</a></legend>
    <fieldset>
        <legend><a id="suit" href="#suit">suit</a></legend>
        <p>[gettext]The SUIT object.[/gettext]</p>
    </fieldset>
    <fieldset>
        <legend><a id="templating" href="#templating">templating</a></legend>
        <p>[gettext]The Templating object.[/gettext]</p>
    </fieldset>
</fieldset>

<fieldset>
    <legend><a id="returnvalue" href="#returnvalue">[gettext]Return Value[/gettext]</a></legend>
    <p>[gettext]The BBCode object.[/gettext]</p>
</fieldset>

<fieldset>
    <legend><a id="examples" href="#examples">[gettext]Examples[/gettext]</a></legend>
    <fieldset>
        <legend><a id="basicusage" href="#basicusage">[gettext]Basic Usage[/gettext]</a></legend>
        <fieldset>
            <legend class="noscript">[gettext]PHP[/gettext]</legend>
            [transform function="pygments" lexer="php"]<?php
$suit = new SUIT();
$templating = new Templating($suit);
$bbcode = new BBCode($suit, $templating);
// Result: The BBCode object.
?>[/transform]
        </fieldset>
    </fieldset>
</fieldset>