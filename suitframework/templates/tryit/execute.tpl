[execute][template]suitframework/templates/tryit/templates/execute/header.tpl[/template][/execute]
[if condition="loggedin"]
<p>Welcome, [var]username[/var]!</p>
[/if]
[if condition="loggedin" not="true"]
<p>Please log in.</p>
[/if]
<fieldset>
    <legend>Who's Online?</legend>
    <p>
        [comment]Generate a Who's Online list from a list of members.[/comment]
        [loop value="value" iterable="members" join=","]
        [if condition="value.admin"]<strong>[/if]
        [if condition="value.banned"]<del>[/if]
        [var]value.name[/var]
        [if condition="value.admin"]</strong>[/if]
        [if condition="value.banned"]</del>[/if]
        [/loop]
    </p>
</fieldset>
[execute][template]suitframework/templates/tryit/templates/execute/footer.tpl[/template][/execute]