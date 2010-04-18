[trim]
[call function="header" /]
[call function="tryit" /]
[assign var="condition.tryit"]true[/assign]
[assign var="title"][gettext]Try It[if condition="condition.rule"] - [c]rule[/c][/if][/gettext][/assign]
[execute][template]header.tpl[/template][/execute]
[/trim]
        [if condition="condition.rule"]
        <p><strong>[gettext]This editor is running on SUIT for Python, but it provides all versions of the code applicable. The templates contain comments about the few (if any) things that need to be changed for the other versions.[/gettext]</strong></p>
        [if condition="template"]
        <fieldset id="html">
            <legend class="yesscript" style="display: none"><a href="#null" id="htmllink">[gettext]HTML - Click to toggle[/gettext]</a></legend>
            <legend class="noscript">[gettext]HTML[/gettext]</legend>
[c entities="false"]executed[/c]
        </fieldset>
        <fieldset class="noscript" id="text">
            <legend class="yesscript" style="display: none"><a href="#null" id="textlink">[gettext]Text - Click to toggle[/gettext]</a></legend>
            <legend class="noscript">[gettext]Text[/gettext]</legend>
<pre>[c]executed[/c]</pre>
        </fieldset>
        [/if]
[trim]
        <form action="#" method="post">
        <p>[gettext]Template[/gettext]: <textarea name="template" style="width: 100%;" wrap="off" rows="20">
[c]template[/c]</textarea></p>
        <p>
            <input type="checkbox" name="entities" value="true"[if condition="executeconfig.entities"] checked="checked"[/if]/> [gettext]Entities[/gettext]
            <input type="checkbox" name="insensitive" value="true"[if condition="executeconfig.insensitive"] checked="checked"[/if] /> [gettext]Insensitive[/gettext]
            <input type="checkbox" name="linebreak" value="true"[if condition="executeconfig.linebreak"] checked="checked"[/if] /> [gettext]Line Break[/gettext]
            <input type="checkbox" name="log" value="true"[if condition="executeconfig.log"] checked="checked"[/if] /> [gettext]Log[/gettext]
            <input type="checkbox" name="mismatched" value="true"[if condition="executeconfig.mismatched"] checked="checked"[/if] /> [gettext]Mismatched[/gettext]
            <input type="checkbox" name="unclosed" value="true"[if condition="executeconfig.unclosed"] checked="checked"[/if] /> [gettext]Unclosed[/gettext]
        </p>
        <p>
            [gettext]Escape[/gettext]: <input type="text" name="escape" value="[c]executeconfig.escape[/c]" />
        </p>
        <p><input type="submit" name="submit" value="[gettext]Submit[/gettext]" /></p>
        </form>
        [if condition="condition.php"]
        <fieldset id="php">
            [if condition="condition.python"]
            <legend class="yesscript" style="display: none"><a href="#null" id="phplink">[gettext]PHP - Click to toggle[/gettext]</a></legend>
            <legend class="noscript"><legend>[gettext]PHP[/gettext]</legend>
            [/if]
            [if condition="condition.python" not="true"]
            <legend>[gettext]PHP[/gettext]
            [/if]
            [transform function="pygments" lexer="php"][c entities="false"]php[/c][/transform]
        </fieldset>
        [/if]
        [if condition="condition.python"]
        <fieldset class="noscript" id="python">
            [if condition="condition.php"]
            <legend class="yesscript" style="display: none"><a href="#null" id="pythonlink">[gettext]Python - Click to toggle[/gettext]</a></legend>
            <legend class="noscript"><legend>[gettext]Python[/gettext]</legend>
            [/if]
            [if condition="condition.php" not="true"]
            <legend>[gettext]PHP[/gettext]
            [/if]
            [transform function="pygments" lexer="python"][c entities="false"]python[/c][/transform]
        </fieldset>
        [/if]
[/trim]
        [/if]
[trim]
        [if condition="condition.rule" not="true"]
        <p>[gettext]Select a rule:[/gettext]</p>
        <ul>
            <li><a href="[url controller="root" action="template" templatefile="tryit" parameter1="templating" /]">[gettext]Templating[/gettext]</a></li>
            <li><a href="[url controller="root" action="template" templatefile="tryit" parameter1="suitlons" /]">[gettext]SUITlons[/gettext]</a></li>
            <li><a href="[url controller="root" action="template" templatefile="tryit" parameter1="bbcode" /]">[gettext]BBCode[/gettext]</a></li>
        </ul>
        [/if]
[execute][template]footer.tpl[/template][/execute]
[/trim]