# Part 3 — Troubleshooting

1. Every time the playbook runs, Nginx will be restarted.

2. I would change `latest` to `present` to avoid unnecessary updates.

3. I would change `restarted` to `reloaded`. As a possible improvement, I would turn the playbook into a role and add a handler.

4. I would add another task to run `nginx -t` to check the configuration. I would need to research how to get and check the result.

5. I would enable debug in the tasks to see which one failed and identify why. I would also run the playbook directly on the server to look for an operating system error rather than an Ansible error.

- name: Install nginx
  ansible.builtin.package:
    name: nginx
    state: present

- name: Copy configuration
  ansible.builtin.copy:
    src: nginx.conf
    dest: /etc/nginx/nginx.conf

- name: Restart nginx
  ansible.builtin.service:
    name: nginx
    state: reloaded
