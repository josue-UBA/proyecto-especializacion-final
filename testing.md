# deploy

- install dependancies
```bash
cd PATH/TO/REPOSITORY/cocotb
python3 -m venv venv
source ./venv/bin/activate
pip3 install -r requirements
```
- test accumulator
```bash
cd PATH/TO/REPOSITORY/cocotb/examples/accumulator
make
```
- test control unit 
```bash
cd PATH/TO/REPOSITORY/cocotb/examples/control_unit
make
```
- test complete module 
```bash
cd PATH/TO/REPOSITORY/cocotb/examples/core
make
```

# info
need to add this code on your test in order to use `coco_tools` library
```bash
export PYTHONPATH := $(PYTHONPATH):/home/josue/workdir/proyecto-especializacion-final
```

```python
import sys
# sys.path.append(os.path.dirname(os.path.abspath(__file__)))
ruta_modulo = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', 'src'))
sys.path.append(ruta_modulo)
```




% =================== SUB-SUB-SECTION
% ====================================== SUB-SECTION
% ============================================================================ SECTION

