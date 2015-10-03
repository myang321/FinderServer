import sys
import os.path
import sae
from finder_server_project import wsgi

os.environ['DJANGO_SETTINGS_MODULE'] = 'finder_server_project.settings'
sys.path.append(os.path.join(os.path.dirname(__file__), 'finder_server_project'))

application = sae.create_wsgi_app(wsgi.application)
