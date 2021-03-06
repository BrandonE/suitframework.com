# -*- coding: utf-8 -*-
"""Helper functions

Consists of functions to typically be used within templates, but also
available to Controllers. This module is available to templates as 'h'.
"""
# Import helpers as desired, or define your own, ie:
#from webhelpers.html.tags import checkbox, password
try:
    import json
except ImportError:
    import simplejson as json
import os
from glob import glob
from pylons import config, request, response, session, tmpl_context as c, url
from pylons.controllers.util import redirect
from pylons.i18n import get_lang, set_lang, ugettext as _gettext
from suitframework.lib import helperstry
import suit
from rulebox import templating
import urllib
from webhelpers.html import escape
from webhelpers.html.builder import literal
from pygments import highlight
from pygments.lexers import get_lexer_by_name
from pygments.formatters import HtmlFormatter

def code(string):
    return string.replace(
        '\t', '    '
    ).replace(
        '\r\n', '\n'
    ).replace(
        '\r', '\'n'
    ).replace(
        '\n ', '\n&nbsp;'
    ).replace(
        '  ', ' &nbsp;'
    ).replace(
        '\n', '<br />'
    )

def docs():
    c.loop.articles = [
        {
            'articles': 
            [
                {
                    'title': 'Getting Started',
                    'url': 'gettingstarted'
                },
                {
                    'title': 'Comparison of SUIT to its Alternatives',
                    'url': 'comparison'
                },
                {
                    'title': 'Features',
                    'url': 'features'
                },
                {
                    'title': 'Reading Docs',
                    'url': 'readingdocs'
                },
                {
                    'title': 'Rules',
                    'url': 'rules'
                },
                {
                    'title': 'Rules Vs. Functions',
                    'url': 'rulesvsfunctions'
                },
                {
                    'title': 'Attributes',
                    'url': 'attributes'
                },
                {
                    'title': 'Escaping',
                    'url': 'escaping'
                },
                {
                    'title': 'Cache',
                    'url': 'cache'
                },
                {
                    'title': 'FAQ',
                    'url': 'faq'
                },
                {
                    'title': 'History',
                    'url': 'history'
                },
                {
                    'title': 'Changelog',
                    'url': 'changelog'
                },
                {
                    'title': 'Credits',
                    'url': 'credits'
                }
            ],
            'title': 'General',
            'url': 'general'
        },
        {
            'articles': 
            [
                {
                    'title': 'execute',
                    'url': 'execute'
                },
                {
                    'title': 'tokens',
                    'url': 'tokens'
                },
                {
                    'title': 'parse',
                    'url': 'parse'
                },
                {
                    'title': 'walk',
                    'url': 'walk'
                }
            ],
            'title': 'SUIT Functions',
            'url': 'suitfunctions'
        },
        {
            'articles':
            [
                {
                    'title': 'SUIT Construct',
                    'url': 'suitconstruct'
                },
                {
                    'title': 'Templating Construct',
                    'url': 'templatingconstruct'
                },
                {
                    'title': 'BBCode Construct',
                    'url': 'bbcodeconstruct'
                }
            ],
            'title': 'Constructs',
            'url': 'constructs'
        },
        {
            'articles':
            [
                {
                    'title': 'var',
                    'url': 'var'
                },
                {
                    'title': 'if',
                    'url': 'if'
                },
                {
                    'title': 'loop',
                    'url': 'loop'
                },
                {
                    'title': 'comment',
                    'url': 'comment'
                },
                {
                    'title': 'template',
                    'url': 'template'
                },
                {
                    'title': 'execute (Templating Rule)',
                    'url': 'executetemplatingrule'
                },
                {
                    'title': 'assign',
                    'url': 'assign'
                },
                {
                    'title': 'entities',
                    'url': 'entities'
                },
                {
                    'title': 'skip',
                    'url': 'skip'
                },
                {
                    'title': 'call',
                    'url': 'call'
                },
                {
                    'title': 'transform',
                    'url': 'transform'
                },
                {
                    'title': 'try',
                    'url': 'try'
                },
                {
                    'title': 'return',
                    'url': 'return'
                },
                {
                    'title': 'trim',
                    'url': 'trim'
                },
                {
                    'title': 'local',
                    'url': 'local'
                },
                {
                    'title': 'bracket',
                    'url': 'bracket'
                }
            ],
            'title': 'Templating Rules',
            'url': 'templatingrules'
        },
        {
            'articles':
            [
                {
                    'title': 'c',
                    'url': 'c'
                },
                {
                    'title': 'template (SUITlons Rule)',
                    'url': 'templatesuitlonsrule'
                },
                {
                    'title': 'gettext',
                    'url': 'gettext'
                },
                {
                    'title': 'url',
                    'url': 'url'
                }
            ],
            'title': 'SUITlons Rules',
            'url': 'suitlonsrules'
        },
        {
            'articles':
            [
                {
                    'title': 'b',
                    'url': 'b'
                },
                {
                    'title': 'i',
                    'url': 'i'
                },
                {
                    'title': 'u',
                    'url': 'u'
                },
                {
                    'title': 's',
                    'url': 's'
                },
                {
                    'title': 'url (BBCode Rule)',
                    'url': 'urlbbcoderule'
                },
                {
                    'title': 'email',
                    'url': 'email'
                },
                {
                    'title': 'img',
                    'url': 'img'
                },
                {
                    'title': 'size',
                    'url': 'size'
                },
                {
                    'title': 'font',
                    'url': 'font'
                },
                {
                    'title': 'color',
                    'url': 'color'
                },
                {
                    'title': 'align',
                    'url': 'align'
                },
                {
                    'title': 'list',
                    'url': 'list'
                },
                {
                    'title': 'quote',
                    'url': 'quote'
                },
                {
                    'title': 'code',
                    'url': 'code'
                }
            ],
            'title': 'BBCode Rules',
            'url': 'bbcoderules'
        },
        {
            'articles':
            [
                {
                    'title': 'SLACKS',
                    'url': 'slacks'
                },
                {
                    'title': 'Try It',
                    'url': 'tryit'
                }
            ],
            'title': 'Subprojects',
            'url': 'subprojects'
        }
    ]
    c.condition.notfound = False
    c.condition.article = False
    c.condition.index = False
    c.condition.matches = False
    if not c.parameter1:
        c.condition.index = True
    elif os.path.isfile(
        os.path.join(
            config['pylons.paths']['templates'],
            'docs',
            os.path.normpath(c.parameter1.lower()) + '.tpl'
        )
    ):
        for category in c.loop.articles:
            for article in category['articles']:
                if c.parameter1 == article['url']:
                    c.article = article['title']
                    c.condition.article = True
                    break
    if c.parameter1 and not c.condition.article:
        c.loop.search = []
        for category in c.loop.articles:
            for article in category['articles']:
                if article['title'].lower().find(c.parameter1.lower()) != -1:
                    c.loop.search.append(article)
        c.condition.notfound = True
        c.condition.matches = (c.loop.search)
    return ''

def exittemplate(value = None):
    exit(value)

def format(string):
    string = templating.getvariable(string, '.', c)
    return json.dumps(string, sort_keys=True, indent=4)

def header():
    c.slackslog = request.POST
    if ('submit' in request.POST and
    request.POST['submit'] == _gettext('Search')):
        redirect(
            url(
                controller = 'root',
                action = 'template',
                templatefile = 'docs',
                parameter1 = request.POST['search'].replace(' ', '').lower()
            ),
            code = 303
        )
    c.loop.languages = {
        'es': {
            'title': u'Español - 0%'
        },
        'fr': {
            'title': u'Français - 8%'
        }
    }
    if (
        'language' in request.POST and
        (
            request.POST['language'] in c.loop.languages or
            request.POST['language'] == ''
        )
    ):
        session['lang'] = request.POST['language']
        session.save()
    if 'lang' in session:
        set_lang(session['lang'])
    for value in c.loop.languages.items():
        c.loop.languages[value[0]]['selected'] = (
            get_lang() and
            get_lang()[0] == value[0]
        )
    return ''

def increment(num):
    num = templating.getvariable(num, '.', c)
    return json.dumps(num + 1)

def indict(obj, key):
    obj = templating.getvariable(obj, '.', c)
    boolean = False
    if key in obj:
        boolean = True
    return json.dumps(boolean)

def isdict(obj):
    obj = templating.getvariable(obj, '.', c)
    boolean = False
    if isinstance(obj, dict):
        boolean = True
    return json.dumps(boolean)

def pygments(lexer, string):
    return highlight(string, get_lexer_by_name(lexer), HtmlFormatter())
    
def slacks():
    if ('submit' in request.POST and
    request.POST['submit'] == _gettext('Submit')):
        redirect(
            ''.join
            ((
                url(
                    controller = 'root',
                    action = 'template',
                    templatefile = 'slacks'
                ),
                '?url=',
                urllib.quote_plus(request.POST['url'])
            )),
            code = 303
        )
    c.referrer = ''
    if 'referer' in request.headers:
        c.referrer = request.headers['referer']
    c.condition.invalid = False
    c.condition.first = True
    c.condition.referrer = (
        'referrer' in request.GET and
        request.GET['referrer']
    )
    c.iteration = -1
    c.log = {
        'hash': {},
        'contents': []
    }
    c.condition.big = False
    try:
        loaded = True
        if 'url' in request.GET:
            suit.log = {
                'hash': {},
                'contents': []
            }
            log = urllib.urlopen(
                request.GET['url'],
                urllib.urlencode({
                    'slacks': 'true'
                })
            ).read()
        elif ('submit' in request.POST and
        request.POST['submit'] == _gettext('Upload')):
            log = request.POST['file'].file.read()
        else:
            loaded = False
        if loaded:
            if len(log) > 100000:
                c.condition.big = True
            else:
                c.log = json.loads(log)
                if not c.log['contents']:
                    raise
                for key, value in c.log['hash'].items():
                    c.log['hash'][key] = json.loads(value)
    except (
        AttributeError,
        EOFError,
        IOError,
        NameError,
        TypeError,
        ValueError
    ):
        c.log = {
            'hash': {},
            'contents': []
        }
        c.condition.invalid = True
    return ''

def tokenshighlight(tokens, open, close, flat, end, string):
    tokens = templating.getvariable(tokens, '.', c)
    offset = 0
    original = string
    last = 0
    for value in tokens:
        start = value['bounds']['start']
        color = open
        if value['type'] == 'close':
            color = close
        elif value['type'] == 'flat':
            color = flat
        string = ''.join((
            string[0:last],
            code(escape(string[last:start + offset])),
            color,
            escape(
                string[start + offset:start + offset + len(value['string'])]
            ),
            end,
            string[start + offset + len(value['string']):len(string)]
        ))
        offset = len(string) - len(original)
        last = start + len(value['string']) + offset
    string = ''.join((
        string[0:last],
        code(escape(string[last:len(string)]))
     ))
    return string

def tryit():
    c.condition.rule = True
    c.rule = ''
    rules = {}
    c.executeconfig = {
        'entities': False,
        'escape': '\\',
        'insensitive': True,
        'linebreak': False,
        'log': True,
        'mismatched': False,
        'unclosed': False
    }
    if c.parameter1 == 'templating':
        from rulebox import templating
        rules = templating.rules.copy()
        rules['[template]'] = rules['[template]'].copy()
        rules['[template]']['var'] = rules['[template]']['var'].copy()
        rules['[template]']['var']['list'] = whitelist(
            'suitframework/templates'
        )
        rules['[template]']['var']['list'].append(
            'suitframework/templates/tryit/templates/try/file.tpl'
        )
        rules['[call'] = rules['[call'].copy()
        rules['[call']['var'] = rules['[call']['var'].copy()
        rules['[call']['var']['var'] = rules['[call']['var']['var'].copy()
        rules['[call']['var']['var']['owner'] = helperstry
        c.rule = 'Templating'
    elif c.parameter1 == 'suitlons':
        from rulebox import suitlons
        rules = suitlons.rules.copy()
        rules['[call'] = rules['[call'].copy()
        rules['[call']['var'] = rules['[call']['var'].copy()
        rules['[call']['var']['var'] = rules['[call']['var']['var'].copy()
        rules['[call']['var']['var']['owner'] = helperstry
        c.rule = 'SUITlons'
    elif c.parameter1 == 'bbcode':
        from rulebox import bbcode
        rules = bbcode.rules.copy()
        #Load the BBCode templates
        for key, value in rules.items():
            if 'var' in value and 'label' in value['var']:
                rules[key] = rules[key].copy()
                rules[key]['var'] = rules[key]['var'].copy()
                rules[key]['var']['template'] = open(
                    os.path.join(
                        config['suit.templates'],
                        'bbcode',
                        value['var']['label'] + '.tpl'
                    )
                ).read()
        c.rule = 'BBCode'
        c.executeconfig['entities'] = True
        c.executeconfig['escape'] = ''
        c.executeconfig['linebreak'] = True
    elif c.parameter1 == None:
        c.condition.rule = False
    if 'submit' in request.POST and request.POST['submit']:
        c.executeconfig = {
            'entities': ('entities' in request.POST),
            'escape': request.POST['escape'],
            'insensitive': ('insensitive' in request.POST),
            'linebreak': ('linebreak' in request.POST),
            'log': ('log' in request.POST),
            'mismatched': ('mismatched' in request.POST),
            'unclosed': ('unclosed' in request.POST)
        }
        c.template = request.POST['template']
    else:
        try:
            c.template = open(
                os.path.join(
                    config['suit.templates'],
                    'tryit',
                    c.parameter2 + '.tpl'
                )
            ).read()
        except TypeError:
            c.template = ''
    c.executed = c.template
    c.php = ''
    c.python = ''
    c.templates = []
    c.condition.php = False
    c.condition.python = False
    c.condition.first = True
    try:
        python = os.path.join(
            config['suit.templates'],
            'tryit',
            'code',
            c.parameter2 + '.py'
        )
        execfile(python)
        c.python = open(python).read()
        c.condition.python = True
        c.php = open(
            os.path.join(
                config['suit.templates'],
                'tryit',
                'code',
                c.parameter2 + '.php'
            )
        ).read()
        c.condition.php = True
    except (IOError, TypeError):
        pass
    if c.parameter2:
        for value in glob(
            os.path.join(
                config['suit.templates'],
                'tryit',
                'templates',
                c.parameter2,
                '*'
            )
        ):
            c.templates.append({
                'path': value,
                'base': os.path.basename(value)
            })
    c.condition.templates = len(c.templates)
    if c.executeconfig['entities']:
        c.executed = escape(c.executed)
    if c.executeconfig['linebreak']:
        c.executed = c.executed.replace('\n', literal('<br />\n'))
    c.error = False
    try:
        c.executed = suit.execute(rules, c.executed, c.executeconfig)
    except Exception as inst:
        c.error = inst
    return ''

def whitelist(dir):
    filenames = []
    for value in glob(dir + '/*'):
        if os.path.isdir(value):
            filenames.extend(whitelist(value))
        else:
            filenames.append(os.path.relpath(value))
            filenames.append(os.path.abspath(value))
    return filenames