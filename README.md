# df_box_smoslt-cookbook

This cookbook was designed to create a group environment for SMOSLT application runnig on docker that includes:
1. Jenkins for testing
2. Nexus for artifact storage
3. Tomcat for displaying the webapp

Much of the cookbook and its data container backup scripts were the result of an excellent tutorial here 
```
http://enthused.btr3.com/2014/09/howto-dealing-with-data-in-docker.html
```

## Supported Platforms

Ubuntu 14.04, or any platformat that has a working LXC kernel for running docker

## Attributes

## Usage

### df_box_smoslt::default
installs Docker, creates the base containers 

Include `df_box_smoslt` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[df_box_smoslt::default]"
  ]
}
```

## License and Authors

Author:: Jeff Carapetyan (<jeff@datafundamentals.com>)
