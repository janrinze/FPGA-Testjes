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
          "id": "86ba52b9-48dc-42da-8c12-025449d0faa7",
          "type": "basic.output",
          "data": {
            "name": "leds",
            "range": "[7:0]",
            "pins": [
              {
                "index": "7",
                "name": "LED0",
                "value": "B5"
              },
              {
                "index": "6",
                "name": "LED1",
                "value": "B4"
              },
              {
                "index": "5",
                "name": "LED2",
                "value": "A2"
              },
              {
                "index": "4",
                "name": "LED3",
                "value": "A1"
              },
              {
                "index": "3",
                "name": "LED4",
                "value": "C5"
              },
              {
                "index": "2",
                "name": "LED5",
                "value": "C4"
              },
              {
                "index": "1",
                "name": "LED6",
                "value": "B3"
              },
              {
                "index": "0",
                "name": "LED7",
                "value": "C3"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 1880,
            "y": 112
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
            "x": 104,
            "y": 320
          }
        },
        {
          "id": "f9e9e970-e64b-404d-8290-023bb47748c7",
          "type": "basic.code",
          "data": {
            "code": "reg [23:0] teller = 0;\n\nalways@(posedge clk)\nbegin\n    teller <= teller + 1;\nend\n\nassign out = teller[23:21];",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clk"
                }
              ],
              "out": [
                {
                  "name": "out",
                  "range": "[2:0]",
                  "size": 3
                }
              ]
            }
          },
          "position": {
            "x": 832,
            "y": 128
          },
          "size": {
            "width": 392,
            "height": 248
          }
        },
        {
          "id": "2dd7fe75-2d42-4e43-8b39-2f86787efd12",
          "type": "basic.code",
          "data": {
            "code": "reg [7:0] out;\n\nalways@(*)\nbegin\n    case(in)\n        0: out = 8'b00000001;\n        1: out = 8'b00000010;\n        2: out = 8'b00000100;\n        3: out = 8'b00001000;\n        4: out = 8'b00010000;\n        5: out = 8'b00100000;\n        6: out = 8'b01000000;\n        7: out = 8'b10000000;\n    endcase\nend",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "in",
                  "range": "[2:0]",
                  "size": 3
                }
              ],
              "out": [
                {
                  "name": "out",
                  "range": "[7:0]",
                  "size": 8
                }
              ]
            }
          },
          "position": {
            "x": 1344,
            "y": 72
          },
          "size": {
            "width": 416,
            "height": 360
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
            "x": 296,
            "y": 160
          },
          "size": {
            "width": 416,
            "height": 376
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "2dd7fe75-2d42-4e43-8b39-2f86787efd12",
            "port": "out"
          },
          "target": {
            "block": "86ba52b9-48dc-42da-8c12-025449d0faa7",
            "port": "in"
          },
          "size": 8
        },
        {
          "source": {
            "block": "f9e9e970-e64b-404d-8290-023bb47748c7",
            "port": "out"
          },
          "target": {
            "block": "2dd7fe75-2d42-4e43-8b39-2f86787efd12",
            "port": "in"
          },
          "size": 3
        },
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
        }
      ]
    }
  },
  "dependencies": {}
}