Chewa-lang
-----------

This is an attempt at creating an
[esolang](https://en.wikipedia.org/wiki/Esoteric_programming_language)
that makes use of [Chewa](https://en.wikipedia.org/wiki/Chewa_language)
keywords. The language will compile down to Javascript (Specifically ES6).
The following is an example script of what am aiming for:

    gawo zamoyo {
        gulu Nyama {
            ndondomeko yenda() {
                // Yenda...
            }
            
            ndondomeko puma () {
                // Puma...
            }
        }

        gulu Munthu < Nyama {
            ndondomeko yenda () {
                kholo.yenda();	// Panga ndondomeko yoyenda ya nyama
            }
        }

        munthu = Munthu();
        ngati munthu ali Nyama {
            nena 'Munthu ndi nyama';
        } kapena {
            nena 'Munthu si nyama';
        }
    }

## Setup

- You need bison, flex, GNU Make, and obviously a C compiler. Source this
in whatever way is available on your operating system. In the case of
mine (which is debian), simply do the following:

```sh
$ apt-get install build-essential flex bison
```

- To compile the damn thing, just run `make` like so:
```sh
$ make
```

