# SODALITE TOSCA Tests Module
Based on [TOSCA Simple Profile in YAML Version 1.3](https://docs.oasis-open.org/tosca/TOSCA-Simple-Profile-YAML/v1.3/csprd01/TOSCA-Simple-Profile-YAML-v1.3-csprd01.html) and [Ansible](https://www.ansible.com/).

To work with these tests, you need to have the modules folder in the same folder as this `readme.md`!
## Nodes
### sodalite.nodes:
 - Tests
    - Text
        - File
        - URI
            - Download
            - Redirect (URL)
            - Response
        - Command (stdout, stderr)
    - File
        - Exist
        - Mode
        - Checksum
        - Ownership (user/group, name/id)
        - Size (eq, lt, lt, gt gt)
    - Command (linux, windows)
        - Return (Code)
        - Time (eq, lt, lt, gt gt)
        
### Node usage/documentation
Note that all nodes are tree structured, which means that they inherit all previous properties and attributes. You can find examples for all nodes [here](unit_tests.yaml).
#### sodalite.nodes.Tests
Base node for all the tests. Defines the return status (status) and return value (checked_against) attributes for all tests.
##### Arguments
- status [string] (Serves as a return value of the test)
- checked_against [string] (Serves as a return value of the data that the test is testing)
#### sodalite.nodes.Tests.Text
Base node for all text/regex based tests. All nodes inherited from this one should implement a match and regex comparator (which one is used by teh playbook is based on the regex parameter) and should use "comparable_string" as a string to compare the tested string to.
##### Properties
- comparable_string [string, required] (String to compare to the file's contents. This parameter usage depends on the regex property)
- regex [boolean, required]: false (If true, comparable string is used as regex pattern to search the string against. Otherwise a direct comparison is made)
#### sodalite.nodes.Tests.Text.File
Tests file contents as defined in the [sodalite.nodes.Tests.Text](#sodalitenodesteststext).
##### Properties
- file_location [string, required] (Path to the file to be tested)
#### sodalite.nodes.Tests.Text.URI
Base node for all URI based text tests. Also tests URI response body as defined in the [sodalite.nodes.Tests.Text](#sodalitenodesteststext).
##### Properties
Passes most properties of the [Ansible URI module](https://docs.ansible.com/ansible/latest/modules/uri_module.html).
##### Attributes:
- response_status [string] (Server's response status)
#### sodalite.nodes.Tests.Text.URI.Download
Attempts to download any content if possible, otherwise just downloads the text content and tests it in a similair manner to the [sodalite.nodes.Tests.Text.File](#sodalitenodesteststextfile).
#### sodalite.nodes.Tests.Text.URI.Redirect
Follows redirects (following the rules provided in the "follow_redirects" parameter) to get the final redirect url. Then compares it as defined in the [sodalite.nodes.Tests.Text](#sodalitenodesteststext).
#### sodalite.nodes.Tests.Text.URI.Response
Reads the response code and compares it as defined in the [sodalite.nodes.Tests.Text](#sodalitenodesteststext).
#### sodalite.nodes.Tests.Text.Command
Reads the command response (stdout/stderr) and compares it as defined in the [sodalite.nodes.Tests.Text](#sodalitenodesteststext).
##### Properties
- command [string, required] (Command for execution)
- dir [string] (Command execution home (leave empty to leave it current))
- executable [string] (Shell used to execute the command (leave empty to leave it current))
- compare_to [string {stdout, stderr}]: stdout (Use stdout/stderr to compare to the comparable string)
- host_os [string {linux, windows}]: linux (Selects which command execution module is used depending on the os)
#### sodalite.nodes.Tests.File
Base node for file based tests.
##### Properties
- file_location [string, required] (Path to the file to be tested)
- follow [string {yes, no}]: no (Whether the test follows symlinks (if applicable))
#### sodalite.nodes.Tests.File.Exist
Checks if file exists or doesn't exist.
##### Properties
- exists [boolean]: true (Toggles between checking for its existance and lack of existance)
#### sodalite.nodes.Tests.File.Mode
Checks for the file's Unix mode number.
##### Properties
- mode [string, required] (File's mode)
#### sodalite.nodes.Tests.File.Checksum
Checks for the file's checksum.
##### Properties
- checksum [string, required] (File's supposed checksum)
- checksum_algorithm [string {md5, sha1, sha224, sha256, sha384, sha512}]: sha1 (Algorithm used to calculate the file's checksum)
#### sodalite.nodes.Tests.File.Owner
Checks for the file's owner user or owner group.
##### Properties
- owner [string, required] (File's supposed owner)
- check_group [boolean]: false (Determines whether the node checks for the user or the group)
- check_id [boolean]: false (Determines whether the node checks for the name or ID)
#### sodalite.nodes.Tests.File.Size
Checks for the file's size and compares it using the specified comparator.
##### Properties
- size [integer, required] (File's supposed/comparable size)
- comparator [string {eq, lt, gt, le, ge}]: eq (The comparator used to test the supposed file size with)
#### sodalite.nodes.Tests.Command
Base node for command based tests.
##### Properties
- command [string, required] (Command for execution)
- dir [string] (Command execution home (leave empty to leave it current))
- executable [string] (Shell used to execute the command (leave empty to leave it current))
- host_os [string {linux, windows}]: linux (Selects which command execution module is used depending on the os)
#### sodalite.nodes.Tests.Command.Return
Checks command's return code.
##### Properties
- response_code [integer]: 0 (Comparable response code)
#### sodalite.nodes.Tests.Command.Time
Executes the command and checks for the command execution duration then compares it using the specified comparator.
##### Properties
- time [float, required] (Command's supposed/comparable duration)
- comparator [string {eq, lt, gt, le, ge}]: lt (The comparator used to test the supposed command execution duration with)

### Openstack/remote test examples
To test openstack functionality, you first need to copy your OS openrc file to the root of the project and name it `SODALITE-openrc-sh`. Now create a key pair/self-signed CA and copy it inside the modules/docker/artifacts/. The public and private key files must be named ca.crt and ca.key respectively. The computer that will run these tests also has to have the ssh key pair properly set up in order to be able to connect to the VM at all. You also may want to change the settings in the openstack_test.yaml, lines 35 to 41 to make the test work with your own key pair etc.

To launch the tests, use the redeploy_openstack_test.bash and type in your openrc/openstack password.

##### A brief summary of what this test does:
L - your local computer, V - openstack virtual machine, D - docker instance

Sequence:
* L - creates OS VM
* V - creates a local file
* V - tests the local file contents
* V - installs docker on itself and loads an echo service image that responds to port 5678
* V - tests the response of the docker image