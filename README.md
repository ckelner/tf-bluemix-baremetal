# Terraform IBM Bluemix Bare Metal Server

An example Terraform configuration template to deploy an IBM Cloud bare metal server.

# Usage

This is not a module, it is a terraform configuration template that can be cloned to be used.

Variables can be defined or overwritten using `terraform.tfvars`.

Available IBM Cloud data centers are listed in the section below and can be changed from the default `dal06` by overwriting the default in `terraform.tfvars` using `datacenter = <new-value>`.

You will need to [Setup up IBM Cloud provider credentials](#setting-up-provider-credentials), please see the section titled "[Setting up Provider Credentials](#setting-up-provider-credentials)" for help.

# Available Data Centers
- ams01 : Amsterdam 1
- ams03 : Amsterdam 3
- che01 : Chennai 1
- dal01 : Dallas 1
- dal10 : Dallas 10
- dal12 : Dallas 12
- dal02 : Dallas 2
- dal05 : Dallas 5
- dal06 : Dallas 6
- dal07 : Dallas 7
- dal09 : Dallas 9
- fra02 : Frankfurt 2
- hkg02 : Hong Kong 2
- hou02 : Houston 2
- lon02 : London 2
- mel01 : Melbourne 1
- mex01 : Mexico 1
- mil01 : Milan 1
- mon01 : Montreal 1
- osl01 : Oslo 1
- par01 : Paris 1
- sjc01 : San Jose 1
- sjc03 : San Jose 3
- sao01 : Sao Paulo 1
- sea01 : Seattle 1
- seo01 : Seoul 1
- sng01 : Singapore 1
- syd01 : Sydney 1
- syd04 : Sydney 4
- tok02 : Tokyo 2
- tor01 : Toronto 1
- wdc01 : Washington 1
- wdc04 : Washington 4

# Example output

## Terraform Plan
```
$ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

Note: You didn't specify an "-out" parameter to save this plan, so when
"apply" is called, Terraform can't guarantee this is what will execute.

+ ibmcloud_infra_bare_metal.baremetal-test
    datacenter:           "dal06"
    domain:               "bar.test.com"
    fixed_config_preset:  "S1270_32GB_1X1TBSATA_NORAID"
    hostname:             "test"
    hourly_billing:       "true"
    network_speed:        "100"
    os_reference_code:    "UBUNTU_16_64"
    private_ipv4_address: "<computed>"
    private_network_only: "false"
    private_subnet:       "<computed>"
    private_vlan_id:      "<computed>"
    public_ipv4_address:  "<computed>"
    public_subnet:        "<computed>"
    public_vlan_id:       "<computed>"


Plan: 1 to add, 0 to change, 0 to destroy.
```

## Terraform Apply
```
$ terraform apply
ibmcloud_infra_bare_metal.baremetal-test: Creating...
  datacenter:           "" => "dal06"
  domain:               "" => "bar.test.com"
  fixed_config_preset:  "" => "S1270_32GB_1X1TBSATA_NORAID"
  hostname:             "" => "test"
  hourly_billing:       "" => "true"
  network_speed:        "" => "100"
  os_reference_code:    "" => "UBUNTU_16_64"
  private_ipv4_address: "" => "<computed>"
  private_network_only: "" => "false"
  private_subnet:       "" => "<computed>"
  private_vlan_id:      "" => "<computed>"
  public_ipv4_address:  "" => "<computed>"
  public_subnet:        "" => "<computed>"
  public_vlan_id:       "" => "<computed>"
ibmcloud_infra_bare_metal.baremetal-test: Still creating... (10s elapsed)
ibmcloud_infra_bare_metal.baremetal-test: Still creating... (20s elapsed)
ibmcloud_infra_bare_metal.baremetal-test: Still creating... (30s elapsed)
...
ibmcloud_infra_bare_metal.baremetal-test: Still creating... (30m40s elapsed)
ibmcloud_infra_bare_metal.baremetal-test: Still creating... (30m50s elapsed)
ibmcloud_infra_bare_metal.baremetal-test: Creation complete

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
```

## Terraform Show
```
$ terraform show
ibmcloud_infra_bare_metal.baremetal-test:
  id = 253372
  datacenter = dal06
  domain = bar.test.com
  fixed_config_preset = S1270_32GB_1X1TBSATA_NORAID
  hostname = test
  hourly_billing = true
  network_speed = 100
  os_reference_code = UBUNTU_16_64
  private_ipv4_address = 10.146.117.117
  private_network_only = false
  public_ipv4_address = 169.45.13.169
```

## Ping & SSH
```
$ ping 169.45.13.169
PING 169.45.13.169 (169.45.13.169): 56 data bytes
64 bytes from 169.45.13.169: icmp_seq=0 ttl=54 time=34.413 ms
64 bytes from 169.45.13.169: icmp_seq=1 ttl=54 time=31.297 ms
64 bytes from 169.45.13.169: icmp_seq=2 ttl=54 time=33.252 ms
^C
--- 169.45.13.169 ping statistics ---
3 packets transmitted, 3 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 31.297/32.987/34.413/1.286 ms

$ ssh root@169.45.13.169
The authenticity of host '169.45.13.169 (169.45.13.169)' can't be established.
ECDSA key fingerprint is SHA256:jZASSET54ZjTbGRmL0LviYUfMq5LxVY/Lyf3a6Cm/Q8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '169.45.13.169' (ECDSA) to the list of known hosts.
Password:
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-77-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

root@test:~#
```

## Terraform Destroy
```
ckelner:tf-bluemix-baremetal ckelner$ terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

ibmcloud_infra_bare_metal.baremetal-test: Refreshing state... (ID: 253372)
ibmcloud_infra_bare_metal.baremetal-test: Destroying...
ibmcloud_infra_bare_metal.baremetal-test: Destruction complete

Destroy complete! Resources: 1 destroyed.
```

# Setting up Provider Credentials

To setup the IBM Cloud provider to work with this example there are a few options for managing credentials safely; here we'll cover the preferred method using environment variables. Other methods can be used, please see the [Terraform Getting Started Variable documentation](https://www.terraform.io/intro/getting-started/variables.html) for further details.

## Environment Variables using IBMid credentials

You'll need to export the following environment variables:

- `TF_VAR_ibmid` - your IBMid login
- `TF_VAR_ibmidpw` - your IBMid password
- `TF_VAR_slaccountnum` - the target softlayer account number (while optional, it is REQUIRED if you have multiple accounts associated with your ID; otherwise you will recieve an error similar to `* ibmcloud_infra_virtual_guest.debian_small_virtual_guest: Error ordering virtual guest: SoftLayer_Exception_Public: You do not have permission to verify server orders. (HTTP 500)`)

On OS X this is achieved by entering the following into your terminal, replacing the `<value>` characters with the actual values (remove the `<>`:

- `export TF_VAR_ibmid=<value>`
- `export TF_VAR_ibmidpw=<value>`
- `export TF_VAR_slaccountnum=<value>`

However this is only temporary to your current terminal session, to make this permanent add these export statements to your `~/.profile`, `~/.bashrc`, `~/.bash_profile` or preferred terminal configuration file. If you go this route without running `export ...` in your command prompt, you'll need to source your terminal configuration file from the command prompt like so: `source ~/.bashrc` (or your preferred config file).

### IBMid Credentials

If you happen to get the error `provider.ibmcloud: Client request to fetch IMS token failed with response code 401` you are likely passing the wrong credentials for IBMid (this is different than IBM w3id).

One way to be certain if your credentials are good or not is to test them with the `test-credentials.sh` script in this repo.  Simply execute the following:

```
bash test-credentials.sh <ibmid> <password> <account-number>
```

Replacing `<ibmid>`, `<password>`, and `<account-number>` for real values.  Where `<account-number>` is your Softlayer account number, which can found at https://control.bluemix.net/account/user/profile under the "API Access Information" section prepended to your "API Username" (or in the upper right it is displayed as part of your account information in parenthesis).

Alternatively you can run the following command:

```bash
curl -s -u 'bx:bx' -k -X POST --header \
'Content-Type: application/x-www-form-urlencoded' \
--header 'Accept: application/json' -d \ "grant_type=password&response_type=cloud_iam,ims_portal \
&username=${1}&password=${2}&ims_account=${3}" https://iam.ng.bluemix.net/oidc/token
```

Replacing `${1}` with your IBMid, `${2}` with your IBMid password, and `${3}` with you Softlayer account number.

When you run either of the above methods, a successful response (meaning the credentials are good) looks like (trimmed for brevity):

```json
{
   "access_token":"eyJraWQiOiIyMDE…a72w",
   "refresh_token":"BTJ8…KLaBJ",
   "ims_token":"e56350224c...1d3d3",
   "ims_user_id":6525897,
   "token_type":"Bearer",
   "expires_in":3600,
   "expiration":1489623909
}
```

And if your credentials are wrong, you will get a different response:

```json
{
   "errorCode":"BXNIM0602E",
   "errorMessage":"The credentials you provided are incorrect",
   "errorDetails":"The credentials you entered for the user 'ckelner@us.ibm.com' are incorrect",
   "context":{
      "requestId":"2512082279",
      "requestType":"incoming.OIDC_Token",
      "startTime":"15.03.2017 22:50:39:925 UTC",
      "endTime":"15.03.2017 22:50:40:224 UTC",
      "elapsedTime":"299",
      "instanceId":"tokenservice/1",
      "host":"localhost",
      "threadId":"8791",
      "clientIp":"73.82.211.28",
      "userAgent":"curl/7.43.0",
      "locale":"en_US"
   }
}
```

If you run into this error, you should reset your IBMid password by navigating to https://www.ibm.com/account/profile/us and clicking on "Reset password"
