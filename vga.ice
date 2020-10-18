{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "iCE40-HX8K",
    "graph": {
      "blocks": [
        {
          "id": "f126cbe4-2fab-4d37-af6f-74b5735ae2fc",
          "type": "basic.output",
          "data": {
            "name": "R",
            "pins": [
              {
                "index": "0",
                "name": "K16",
                "value": "K16"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1992,
            "y": -48
          }
        },
        {
          "id": "079cc40b-d677-4c29-896e-547a6b7a9958",
          "type": "basic.output",
          "data": {
            "name": "G",
            "pins": [
              {
                "index": "0",
                "name": "L16",
                "value": "L16"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1992,
            "y": 56
          }
        },
        {
          "id": "f5c7965c-0148-4f8c-a3b3-7f8ae7825f66",
          "type": "basic.output",
          "data": {
            "name": "B",
            "pins": [
              {
                "index": "0",
                "name": "M15",
                "value": "M15"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1992,
            "y": 168
          }
        },
        {
          "id": "4be6c201-c957-48ef-91d1-d30f29b265cf",
          "type": "basic.input",
          "data": {
            "name": "clk",
            "pins": [
              {
                "index": "0",
                "name": "CLK",
                "value": "J3"
              }
            ],
            "virtual": false,
            "clock": true
          },
          "position": {
            "x": 72,
            "y": 216
          }
        },
        {
          "id": "ff65d1e4-0a45-490a-9a26-f271cc12bd0e",
          "type": "basic.output",
          "data": {
            "name": "hsync",
            "pins": [
              {
                "index": "0",
                "name": "P15",
                "value": "P15"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1992,
            "y": 288
          }
        },
        {
          "id": "02655a1a-a759-400d-b203-772d8249e393",
          "type": "basic.output",
          "data": {
            "name": "vsync",
            "pins": [
              {
                "index": "0",
                "name": "R15",
                "value": "R15"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1992,
            "y": 624
          }
        },
        {
          "id": "d79c5df8-05af-4f58-bda6-8fd61457c4ee",
          "type": "basic.code",
          "data": {
            "code": "/**\r\n * PLL configuration\r\n *\r\n * This Verilog module was generated automatically\r\n * using the icepll tool from the IceStorm project.\r\n * Use at your own risk.\r\n *\r\n * Given input frequency:        12.000 MHz\r\n * Requested output frequency:   25.175 MHz\r\n * Achieved output frequency:    25.125 MHz\r\n */\r\n\r\nSB_PLL40_CORE #(\r\n\t\t.FEEDBACK_PATH(\"SIMPLE\"),\r\n\t\t.DIVR(4'b0000),\t\t// DIVR =  0\r\n\t\t.DIVF(7'b1000010),\t// DIVF = 66\r\n\t\t.DIVQ(3'b101),\t\t// DIVQ =  5\r\n\t\t.FILTER_RANGE(3'b001)\t// FILTER_RANGE = 1\r\n\t) uut (\r\n\t\t.LOCK(locked),\r\n\t\t.RESETB(1'b1),\r\n\t\t.BYPASS(1'b0),\r\n\t\t.REFERENCECLK(clock_in),\r\n\t\t.PLLOUTCORE(clock_out)\r\n\t\t);\r\n",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clock_in"
                }
              ],
              "out": [
                {
                  "name": "clock_out"
                },
                {
                  "name": "locked"
                }
              ]
            }
          },
          "position": {
            "x": 304,
            "y": 152
          },
          "size": {
            "width": 200,
            "height": 192
          }
        },
        {
          "id": "f9e9e970-e64b-404d-8290-023bb47748c7",
          "type": "basic.code",
          "data": {
            "code": "// pixel counter \nreg [9:0] teller = 0;\nreg visible = 0;\nreg hsync = 0;\nreg eol = 0;\n\nalways @ (posedge clk)\nbegin\n    if (teller == 0)\n        visible <= 1;\n    if (teller == 640)\n        visible <= 0;\n    if (teller == 656)\n        hsync <= 1;\n    if (teller == 752)\n        hsync <= 0;\n    if (teller == 799)\n    begin\n        teller <= 0;\n        eol <= 1;\n    end\n    else\n    begin\n        teller = teller + 1;\n        eol <= 0;\n    end\nend\n\nassign paddr = teller;",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clk"
                }
              ],
              "out": [
                {
                  "name": "paddr",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "visible"
                },
                {
                  "name": "hsync"
                },
                {
                  "name": "eol"
                }
              ]
            }
          },
          "position": {
            "x": 592,
            "y": -72
          },
          "size": {
            "width": 320,
            "height": 544
          }
        },
        {
          "id": "bc1b1ee6-41a5-46e1-873b-2720e7ffc4a4",
          "type": "7ebc902cbb1c4db116741533a86182485900ecda",
          "position": {
            "x": 1472,
            "y": 120
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "33b5f99b-29c8-490e-8bcc-ba99493b8c88",
          "type": "basic.code",
          "data": {
            "code": "// line counter\nreg [9:0] teller = 0;\nreg visible = 0;\nreg vsync = 0;\nreg eof = 0;\n\nalways @ (posedge clk)\nif (eol == 1)\nbegin\n    if (teller == 0)\n        visible <= 1;\n    if (teller == 480)\n        visible <= 0;\n    if (teller == 490)\n        vsync <= 1;\n    if (teller == 492)\n        vsync <= 0;\n    if (teller == 524)\n    begin\n        teller <=0;\n        eof <= 1;\n    end\n    else\n    begin\n        teller <= teller + 1;\n        eof <= 0;\n    end\nend\n\nassign laddr = teller;",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "eol"
                },
                {
                  "name": "clk"
                }
              ],
              "out": [
                {
                  "name": "laddr",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "visible"
                },
                {
                  "name": "vsync"
                },
                {
                  "name": "eof"
                }
              ]
            }
          },
          "position": {
            "x": 1032,
            "y": 312
          },
          "size": {
            "width": 352,
            "height": 544
          }
        },
        {
          "id": "ae256166-9727-4c14-afa2-f791d1dc6108",
          "type": "basic.code",
          "data": {
            "code": "reg R, G, B;\n\nalways @ (posedge clk)\nbegin\n    R <= paddr[6] & vis;\n    G <= paddr[7] & vis;\n    B <= paddr[8] & vis;\nend",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "paddr",
                  "range": "[9:0]",
                  "size": 10
                },
                {
                  "name": "clk"
                },
                {
                  "name": "vis"
                }
              ],
              "out": [
                {
                  "name": "R"
                },
                {
                  "name": "G"
                },
                {
                  "name": "B"
                }
              ]
            }
          },
          "position": {
            "x": 1624,
            "y": -32
          },
          "size": {
            "width": 296,
            "height": 176
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "4be6c201-c957-48ef-91d1-d30f29b265cf",
            "port": "out"
          },
          "target": {
            "block": "d79c5df8-05af-4f58-bda6-8fd61457c4ee",
            "port": "clock_in"
          }
        },
        {
          "source": {
            "block": "d79c5df8-05af-4f58-bda6-8fd61457c4ee",
            "port": "clock_out"
          },
          "target": {
            "block": "f9e9e970-e64b-404d-8290-023bb47748c7",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "f9e9e970-e64b-404d-8290-023bb47748c7",
            "port": "visible"
          },
          "target": {
            "block": "bc1b1ee6-41a5-46e1-873b-2720e7ffc4a4",
            "port": "18c2ebc7-5152-439c-9b3f-851c59bac834"
          }
        },
        {
          "source": {
            "block": "f9e9e970-e64b-404d-8290-023bb47748c7",
            "port": "hsync"
          },
          "target": {
            "block": "ff65d1e4-0a45-490a-9a26-f271cc12bd0e",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "33b5f99b-29c8-490e-8bcc-ba99493b8c88",
            "port": "vsync"
          },
          "target": {
            "block": "02655a1a-a759-400d-b203-772d8249e393",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "f9e9e970-e64b-404d-8290-023bb47748c7",
            "port": "eol"
          },
          "target": {
            "block": "33b5f99b-29c8-490e-8bcc-ba99493b8c88",
            "port": "eol"
          }
        },
        {
          "source": {
            "block": "d79c5df8-05af-4f58-bda6-8fd61457c4ee",
            "port": "clock_out"
          },
          "target": {
            "block": "33b5f99b-29c8-490e-8bcc-ba99493b8c88",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "33b5f99b-29c8-490e-8bcc-ba99493b8c88",
            "port": "visible"
          },
          "target": {
            "block": "bc1b1ee6-41a5-46e1-873b-2720e7ffc4a4",
            "port": "97b51945-d716-4b6c-9db9-970d08541249"
          }
        },
        {
          "source": {
            "block": "f9e9e970-e64b-404d-8290-023bb47748c7",
            "port": "paddr"
          },
          "target": {
            "block": "ae256166-9727-4c14-afa2-f791d1dc6108",
            "port": "paddr"
          },
          "size": 10
        },
        {
          "source": {
            "block": "d79c5df8-05af-4f58-bda6-8fd61457c4ee",
            "port": "clock_out"
          },
          "target": {
            "block": "ae256166-9727-4c14-afa2-f791d1dc6108",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "bc1b1ee6-41a5-46e1-873b-2720e7ffc4a4",
            "port": "664caf9e-5f40-4df4-800a-b626af702e62"
          },
          "target": {
            "block": "ae256166-9727-4c14-afa2-f791d1dc6108",
            "port": "vis"
          }
        },
        {
          "source": {
            "block": "ae256166-9727-4c14-afa2-f791d1dc6108",
            "port": "B"
          },
          "target": {
            "block": "f5c7965c-0148-4f8c-a3b3-7f8ae7825f66",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "ae256166-9727-4c14-afa2-f791d1dc6108",
            "port": "G"
          },
          "target": {
            "block": "079cc40b-d677-4c29-896e-547a6b7a9958",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "ae256166-9727-4c14-afa2-f791d1dc6108",
            "port": "R"
          },
          "target": {
            "block": "f126cbe4-2fab-4d37-af6f-74b5735ae2fc",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {
    "7ebc902cbb1c4db116741533a86182485900ecda": {
      "package": {
        "name": "AND",
        "version": "1.0.0",
        "description": "AND logic gate",
        "author": "Jesús Arroyo",
        "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20viewBox=%22-252%20400.9%2090%2040%22%3E%3Cpath%20d=%22M-252%20409.9h26v2h-26zM-252%20429.9h27v2h-27z%22/%3E%3Cpath%20d=%22M-227%20400.9v39.9h20.4c11.3%200%2020-9%2020-20s-8.7-20-20-20H-227zm2.9%202.8h17.6c9.8%200%2016.7%207.6%2016.7%2017.1%200%209.5-7.4%2017.1-17.1%2017.1H-224c-.1.1-.1-34.2-.1-34.2z%22/%3E%3Cpath%20d=%22M-187.911%20419.9H-162v2h-25.911z%22/%3E%3C/svg%3E"
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "18c2ebc7-5152-439c-9b3f-851c59bac834",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 64,
                "y": 80
              }
            },
            {
              "id": "664caf9e-5f40-4df4-800a-b626af702e62",
              "type": "basic.output",
              "data": {
                "name": ""
              },
              "position": {
                "x": 752,
                "y": 144
              }
            },
            {
              "id": "97b51945-d716-4b6c-9db9-970d08541249",
              "type": "basic.input",
              "data": {
                "name": ""
              },
              "position": {
                "x": 64,
                "y": 208
              }
            },
            {
              "id": "00925b04-5004-4307-a737-fa4e97c8b6ab",
              "type": "basic.code",
              "data": {
                "code": "// AND logic gate\n\nassign c = a & b;",
                "params": [],
                "ports": {
                  "in": [
                    {
                      "name": "a"
                    },
                    {
                      "name": "b"
                    }
                  ],
                  "out": [
                    {
                      "name": "c"
                    }
                  ]
                }
              },
              "position": {
                "x": 256,
                "y": 48
              },
              "size": {
                "width": 384,
                "height": 256
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "18c2ebc7-5152-439c-9b3f-851c59bac834",
                "port": "out"
              },
              "target": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "a"
              }
            },
            {
              "source": {
                "block": "97b51945-d716-4b6c-9db9-970d08541249",
                "port": "out"
              },
              "target": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "b"
              }
            },
            {
              "source": {
                "block": "00925b04-5004-4307-a737-fa4e97c8b6ab",
                "port": "c"
              },
              "target": {
                "block": "664caf9e-5f40-4df4-800a-b626af702e62",
                "port": "in"
              }
            }
          ]
        }
      }
    }
  }
}