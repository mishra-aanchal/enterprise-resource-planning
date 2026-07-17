import sys
sys.path.insert(0, 'src')
from app import create_app
app = create_app()
print("test_instance.py instance_path:", app.instance_path)
