# Set nvironment variables

# Required for Firefox to open links remotely
set -x MOZ_DBUS_REMOTE 1

# Required for various apps under Sway
set -x XDG_CURRENT_DESKTOP Sway

if status is-interactive
    # Commands to run in interactive sessions can go here
end
