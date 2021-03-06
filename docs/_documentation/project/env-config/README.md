---
title: Environment configuration
permalink: /documentation/project/env-config/
description: Share environment configuration with team members.
---

The `.cikit/environment.yml` will be created, after running the `vagrant up` or `vagrant provision`, with all configuration you made.

## Affect the provisioning runtime

Launching the `cikit provision --limit=HOSTNAME` will not ask you anything, because configuration will be taken from that file. But if you want to override, just pass the options as command line arguments.

```shell
cikit provision --limit=<HOST> \
  --php-version=7.0 \
  --nodejs-version=7 \
  --ruby-version=2.4.0 \
  --solr-version=6.5.1 \
  --http-auth-user=admin \
  --http-auth-pass=password
```

## Regenerate a configuration

Running the `vagrant provision` will ask you the same questions again, but default values will be preselected from what you've chosen before. That's how you can *modify* that file in a right manner. Also, you can create/modify it first and then run `vagrant provision`, bypassing all questions.

Do not hesitate to commit this file to your VCS repository to make others aware about environment they should have. But take care this file to not contain HTTP authentication password if repository is public.
