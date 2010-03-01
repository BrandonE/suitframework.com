[trim]
[h]header[/h]
[assign var="condition.home"]true[/assign]
[assign var="title"][gettext]Home[/gettext][/assign]
[execute][template]header.tpl[/template][/execute]
        <img src="/images/logo.png" alt="Logo" style="float: left; padding: 20px;" />
        <p>[gettext]The World Wide Web has come a long way. Back in the day, if a website provided good information, it could be displayed in plain text with no interaction, and everyone would be satisfied. Although these sites still serve their purpose, today's websites must have a style and dynamic pages to get the average user's attention.[/gettext]</p>
        
        <p>[gettext]Due to this innovation, we now have to worry about two different types of languages: Client-side and Server-side. Some of the (X)HTML, CSS, and Javascript, which the client-side browser will interpret, can stay static on the page, while the changing parts need to be generated by a server-side language like PHP or Python. This means we have several languages on the same document, which can get very messy, and forces all the developers to work on one file. By default, CSS and Javascript can be stored in an external file, but what can we do about the server-side language?[/gettext]</p>

        <p>[gettext]There have been several approaches to this problem. Those who ignore this problem store the markup in a string, concatenate the dynamic elements, and print the document. This requires a lot of symbols, such as quotes, to be escaped. Besides, the majority of the document will be static, so this seems superfluous. Thus, many solutions have simply have templates that contain HTML, and put the logic in between certain tags. Although this looks much better than the original method, it still has two languages integrated into eachother. So, what can separate these elements?[/gettext]</p>

        <p>[gettext]Introducing the <strong>SUIT Framework</strong> (Scripting Using Integrated Templates), an open-source web templating framework. It provides a lightweight and powerful solution to this problem by allowing developers to define your own syntax through the usage of <a href="#Link explaining rules">rules</a> in your server side language of choice. Then, transform the string using SUIT, and problem solved. SUIT currently has both PHP and Python implementations.[/gettext]</p>

        <p>[gettext]So, read the docs, get help in the community, and enjoy clean coding![/gettext]</p>
[execute][template]footer.tpl[/template][/execute]
[/trim]