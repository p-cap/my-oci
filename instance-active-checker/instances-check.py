import subprocess
import json

'''
1. declare any empty array
2. Run the oci command that will:
   - list the compartments
   - compartments with --lifecycle-state that's ACTIVE
   - uses --compartment-id-in-subtree=true to iterate through ALL compartments  
   COMMAND:
   - oci iam compartment list --lifecycle-state ACTIVE --compartment-id-in-subtree True

3. Takes the json return and gets the "id" attribute
4. The "id" attribute is passed onto the active_instance function
   - lists the instances that are RUNNING within a compartment
   - it prints the instances's:
     - display-name
     - instance id
     - lifecycle-state
   COMMAND:
   - oci compute instance list --lifecycle-state RUNNING -c <parameter>
'''

try:
  list_of_compartment_ids = []
  
  # take a compartments and runs oci command to check for running instances
  def active_instance(compartment: str) -> None:
    instances_that_are_active = subprocess.run(['oci', 'compute', 'instance', 'list', "--lifecycle-state", "RUNNING", "-c", f"{compartment}"], capture_output=True, text=True)
    if instances_that_are_active.stdout:
      to_json = json.loads(instances_that_are_active.stdout)
      for i in to_json['data']:
        print(i['display-name'])
        print(i['id'])
        print(i['lifecycle-state'])

  # takes a list of ALL active compartments
  # --compartment-id-in-subtree was a lifesaver
  compartment_active = subprocess.run(['oci', 'iam', 'compartment', 'list', "--lifecycle-state", "ACTIVE", "--compartment-id-in-subtree", "True"], capture_output=True, text=True)

  to_json = json.loads(compartment_active.stdout)

  for i in to_json['data']:
    list_of_compartment_ids.append(i['id'])

  for i in list_of_compartment_ids:
    active_instance(i)

except:
  print("Something is wrong with the code")
