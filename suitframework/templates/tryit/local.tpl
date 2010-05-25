[assign var="title"]Examples[/assign]
[execute][template]suitframework/templates/tryit/templates/local/header.tpl[/template][/execute]
[if condition="loggedin"]
<p>Welcome, [var]username[/var]! The current time is: [call function="currenttime" /]</p>
[/if]
[if condition="loggedin" not="true"]
<p>Please log in.</p>
[/if]
<fieldset>
    <legend>My File</legend>
    [transform function="pygments" lexer="html"][skip]<p>Welcome, [var]username[/var]!</p>[/skip][/transform]
</fieldset>
<fieldset>
    <legend>Who's Online?</legend>
    <p>
        [local]
        [comment]Generate a Who's Online list from a list of members.[/comment]
        [loop value="value" iterable="members" join=","]
        [if condition="value.admin"]<strong>[/if]
        [if condition="value.banned"]<del>[/if]
        [var]value.name[/var]
        [if condition="value.admin"]</strong>[/if]
        [if condition="value.banned"]</del>[/if]
        [/loop]
        [/local]
        [comment]The "value" is no longer set.[/comment]
    </p>
</fieldset>
[execute][template]suitframework/templates/tryit/templates/local/footer.tpl[/template][/execute]