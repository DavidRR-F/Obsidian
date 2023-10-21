
## Operators

Operators are the "workers" that run your tasks. When you define a task in a DAG, you instantiate an operator class to handle that task.

#### Example: Custom Operator

```python
from airflow.models import BaseOperator 
from airflow.utils.decorators import apply_defaults  

class MyCustomOperator(BaseOperator):     
	@apply_defaults     
	def __init__(self, my_param, *args, **kwargs):         
		super(MyCustomOperator, self).__init__(*args, **kwargs)         
		self.my_param = my_param      
		
	def execute(self, context):         
		log.info(f"My custom param: {self.my_param}")
```


## Sensors

Sensors are a special kind of operator that will keep running until a certain criterion is met.

#### Example: Custom Sensor

```python
from airflow.sensors.base_sensor_operator import BaseSensorOperator
from airflow.utils.decorators import apply_defaults

class MyCustomSensor(BaseSensorOperator):
    @apply_defaults
    def __init__(self, my_param, *args, **kwargs):
        super(MyCustomSensor, self).__init__(*args, **kwargs)
        self.my_param = my_param

    def poke(self, context):
        log.info(f"Checking condition with: {self.my_param}")
        # Check condition here
        return True

```

## Hooks

Hooks are interfaces to external platforms and databases, encapsulating connection handling and interactions with these systems.

#### Example: Custom Hook

```python
from airflow.hooks.base_hook import BaseHook
import requests

class MyApiHook(BaseHook):
    def get_conn(self):
        # Implement connection logic here
        pass

    def make_request(self, endpoint):
        # Implement API request logic here
        pass

```

## Executors

Executors determine how tasks are run in parallel. Custom executors can be created to manage task execution in environments where the default executors are not applicable.

#### Example: Custom Executor

Creating a custom executor can be complex and is generally only needed for specialized environments. Here's a simplified example to give a basic idea:

```python
from airflow.executors.base_executor import BaseExecutor

class MyCustomExecutor(BaseExecutor):
    def start(self):
        # Start the executor
        pass

    def execute_async(self, key, command, queue=None, executor_config=None):
        # Execute the task
        pass

    def sync(self):
        # Sync the executor with the scheduler
        pass

    def end(self):
        # End the executor
        pass

```

## Web Views (UI Plugins)

Web views allow you to add new pages to the Airflow UI.

#### Example: Custom View

```python
from flask_admin import BaseView, expose
from airflow.www.app import csrf

class MyCustomView(BaseView):
    @expose("/")
    def my_custom_method(self):
        # Implement your view logic here
        return self.render("my_template.html", param="param")

```

### Using Custom Extensions in Airflow:

- **Operators/Sensors:** Once defined, custom operators and sensors can be used in a DAG file just like built-in ones.
- **Hooks:** Custom hooks can be utilized within operators to interact with external systems.
- **Executors:** Custom executors can be specified in the Airflow configuration under the `[core]` section, `executor` parameter.
- **Web Views:** Custom views need to be added to the `appbuilder_views` or `appbuilder_menu_items` attributes in your `airflow_local_settings` to appear in the UI.

### Note:

Ensure to place your custom plugins in the `plugins` folder and restart the Airflow webserver and scheduler to recognize and import the new plugins. Your custom extensions will now be available for use in your DAGs.

```
airflow/
│
├── dags/
│   ├── my_dag.py
│   └── another_dag.py
│
├── plugins/
│   ├── __init__.py
│   ├── operators/
│   │   ├── __init__.py
│   │   └── my_custom_operator.py
│   │
│   ├── sensors/
│   │   ├── __init__.py
│   │   └── my_custom_sensor.py
│   │
│   ├── hooks/
│   │   ├── __init__.py
│   │   └── my_custom_hook.py
│   │
│   ├── executors/
│   │   ├── __init__.py
│   │   └── my_custom_executor.py
│   │
│   └── views/
│       ├── __init__.py
│       └── my_custom_view.py
│
└── airflow.cfg

```