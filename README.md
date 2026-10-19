# Linux File Types and Testing Lab

## Project Overview

This project demonstrates practical Linux filesystem administration skills, including file-type identification, file testing, symbolic links, hard links, inode inspection, and special filesystem objects.

The lab uses real Linux commands and small experiments to understand how files and links behave.


INSTRUCTION

All the important commands and work is placed in ((((practice-commands-information)))) and all the practice that i did in the file name practical-work, insted of this i did this work in the form of script which is placed in practicing-file-in-script

## Objectives

- Identify common Linux file types.
- Understand regular files, directories, hidden files, and permissions.
- Use `file`, `ls -l`, and `stat` to inspect files.
- Test file types and permissions using the `test` command.
- Create and inspect symbolic links and hard links.
- Compare inode numbers.
- Identify broken symbolic links.
- Practice named pipes, devices, and Unix domain sockets.
- Generate file-type reports and automate basic checks with Bash.

## Technologies and Commands

**Environment:** Linux or Ubuntu on WSL

**Commands:** `file`, `ls`, `stat`, `test`, `find`, `ln`, `readlink`, `chmod`, `mkfifo`, `cat`, `rm`, `mv`, and `cp`

**Scripting:** Bash

**Version control:** Git and GitHub

## Linux File Types

| Symbol | Type | Example |
|---|---|---|
| `-` | Regular file | `notes.txt` |
| `d` | Directory | `documents/` |
| `l` | Symbolic link | `notes-link.txt` |
| `c` | Character device | `/dev/null` |
| `b` | Block device | `/dev/sda`, if available |
| `p` | Named pipe | `/tmp/linux-test-pipe` |
| `s` | Unix socket | A runtime socket under `/run` |

Special device and socket examples depend on the Linux environment.

## Practical Exercises

### 1. Inspect files

```bash
ls -la
file regular-files/notes.txt
stat regular-files/notes.txt
```

### 2. Test files and directories

```bash
test -f regular-files/notes.txt && echo "Regular file"
test -d directories && echo "Directory"
test -r regular-files/notes.txt && echo "Readable"
```

### 3. Create a symbolic link

```bash
ln -s ../regular-files/notes.txt symlinks/notes-link.txt
readlink symlinks/notes-link.txt
ls -l symlinks/notes-link.txt
```

### 4. Create a hard link

```bash
ln regular-files/notes.txt hardlinks/notes-hardlink.txt
ls -li regular-files/notes.txt hardlinks/notes-hardlink.txt
```

Matching inode numbers demonstrate that both directory entries refer to the same underlying file.

### 5. Test a named pipe

```bash
mkfifo /tmp/linux-test-pipe
ls -l /tmp/linux-test-pipe
test -p /tmp/linux-test-pipe && echo "FIFO confirmed"
rm /tmp/linux-test-pipe
```

### 6. Run the testing script

```bash
chmod +x scripts/test-file-types.sh
./scripts/test-file-types.sh
```

## Key Learnings

- Linux file extensions do not determine file type by themselves.
- Symbolic links refer to paths and can become broken.
- Hard links refer to the same inode and underlying file data.
- The `test` command checks file types, existence, and access permissions.
- Special files such as FIFOs, device nodes, and sockets have specific purposes.
- Git repositories are not suitable for preserving live device nodes, sockets, or named pipes as normal tracked files.

## Repository Structure

```text
linux-file-types-and-testing/
├── README.md
├── regular-files/
├── directories/
├── symlinks/
├── hardlinks/
├── scripts/
│   └── test-file-types.sh
└── reports/
```

## Learning Outcome

This project provides hands-on practice with Linux filesystem inspection and link management. It is intended as a beginner-to-intermediate learning lab for Linux System Administration and DevOps.

All experiments should be performed in a test directory or virtual environment, without modifying critical system files.

