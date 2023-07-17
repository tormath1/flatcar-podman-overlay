# Build

```
make podman.raw
```

# Use

Copy podman.raw to /var/lib/extensions.

Copy configs from /usr/etc/ into the appropriate directories in /etc.  Remove the .example extensions.

If you want an example containers.conf, you can retrieve it from [here](https://raw.githubusercontent.com/containers/common/main/pkg/config/containers.conf)
Or simply `curl -O /etc/containers/containers.conf https://raw.githubusercontent.com/containers/common/main/pkg/config/containers.conf`

Optional: If you want rootless containers to work, disable selinux in /etc/selinux/config - must be disabled not permissive. Default file is a symlink so make a copy (`cp /etc/selinux/config{,-}; mv /etc/selinux/config{-,}`)

Optional: If you want remote podman services, run `systemctl enable --now podman.socket`

If you want to remove docker entirely, visit [here](https://github.com/goochjj/flatcar-podman-docker-torcx)

# Use it on Flatcar

For Flatcar, you can transpile this [Butane](https://www.flatcar.org/docs/latest/provisioning/config-transpiler/getting-started/) configuration:

```yaml
variant: flatcar
version: 1.0.0
storage:
  files:
    - path: /opt/extensions/podman.raw
      mode: 0644
      contents:
        source: https://github.com/tormath1/flatcar-podman-overlay/releases/download/v4.5.0/podman.raw
        verification:
          hash: sha512-...
  links:
    - path: /etc/extensions/podman.raw
      hard: false
      target: /opt/extensions/podman.raw
```
