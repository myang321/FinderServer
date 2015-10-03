import sys
import os.path
import sae
from finder_server_project import wsgi
from sae.ext.shell import ShellMiddleware

os.environ['DJANGO_SETTINGS_MODULE'] = 'finder_server_project.settings'
sys.path.append(os.path.join(os.path.dirname(__file__), 'finder_server_project'))

root = os.path.dirname(__file__)
sys.path.insert(0, os.path.join(root, 'site-packages'))

application = sae.create_wsgi_app(ShellMiddleware(wsgi.application))
