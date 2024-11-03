import math

TWO_BITS_WITH = 2
FOUR_BITS_WIDTH = 4
EIGHT_BITS_WIDTH = 8
FIVE_BITS_WIDTH = 5
SEVEN_BITS_WIDTH = 7

configurations = [
    {
        "name": "int4",
        "mult1": [
            {
                "bus": "A",
                "num_width": FOUR_BITS_WIDTH,
                "phase": 0,
                "label": "a",
                "signed": False,
                "number": int(math.pow(2, FOUR_BITS_WIDTH)) - 1,
            },
            {
                "bus": "D",
                "num_width": FOUR_BITS_WIDTH,
                "phase": 22,
                "label": "b",
                "signed": False,
                "number": int(math.pow(2, FOUR_BITS_WIDTH)) - 1,
            },
        ],
        "mult2": [
            {
                "bus": "B",
                "num_width": FOUR_BITS_WIDTH,
                "phase": 0,
                "label": "c",
                "signed": False,
                "number": int(math.pow(2, FOUR_BITS_WIDTH)) - 1,
            },
            {
                "bus": "B",
                "num_width": FOUR_BITS_WIDTH,
                "phase": 11,
                "label": "d",
                "signed": False,
                "number": int(math.pow(2, FOUR_BITS_WIDTH)) - 1,
            },
        ],
    },
    {
        "name": "int8_18",
        "mult1": [
            {
                "bus": "D",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 0,
                "label": "a",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
            {
                "bus": "A",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 18,
                "label": "b",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
        ],
        "mult2": [
            {
                "bus": "B",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 0,
                "label": "c",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
        ],
    },
    {
        "name": "int8_19",
        "mult1": [
            {
                "bus": "D",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 0,
                "label": "a",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
            {
                "bus": "A",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 19,
                "label": "b",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
        ],
        "mult2": [
            {
                "bus": "B",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 0,
                "label": "c",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
        ],
    },
    {
        "name": "int8_21",
        "mult1": [
            {
                "bus": "D",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 0,
                "label": "a",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
            {
                "bus": "A",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 21,
                "label": "b",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
        ],
        "mult2": [
            {
                "bus": "B",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 0,
                "label": "c",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
        ],
    },
    {
        "name": "int8_20",
        "mult1": [
            {
                "bus": "D",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 0,
                "label": "a",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
            {
                "bus": "A",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 20,
                "label": "b",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
        ],
        "mult2": [
            {
                "bus": "B",
                "num_width": EIGHT_BITS_WIDTH,
                "phase": 0,
                "label": "c",
                "signed": False,
                "number": int(math.pow(2, EIGHT_BITS_WIDTH)) - 1,
            },
        ],
    },
    {
        "name": "int5",
        "mult1": [
            {
                "bus": "A",
                "num_width": FIVE_BITS_WIDTH,
                "phase": 24,
                "label": "a",
                "signed": False,
                "number": int(math.pow(2, FIVE_BITS_WIDTH)) - 1,
            },
            {
                "bus": "D",
                "num_width": FIVE_BITS_WIDTH,
                "phase": 0,
                "label": "b",
                "signed": False,
                "number": int(math.pow(2, FIVE_BITS_WIDTH)) - 1,
            },
        ],
        "mult2": [
            {
                "bus": "B",
                "num_width": FIVE_BITS_WIDTH,
                "phase": 0,
                "label": "c",
                "signed": False,
                "number": int(math.pow(2, FIVE_BITS_WIDTH)) - 1,
            },
            {
                "bus": "B",
                "num_width": FIVE_BITS_WIDTH,
                "phase": 12,
                "label": "d",
                "signed": False,
                "number": int(math.pow(2, FIVE_BITS_WIDTH)) - 1,
            },
        ],
    },
    {
        "name": "int2",
        "mult1": [
            {
                "bus": "A",
                "num_width": TWO_BITS_WITH,
                "phase": 24,
                "label": "a",
                "signed": False,
                "number": int(math.pow(2, TWO_BITS_WITH)) - 1,
            },
            {
                "bus": "A",
                "num_width": TWO_BITS_WITH,
                "phase": 12,
                "label": "b",
                "signed": False,
                "number": int(math.pow(2, TWO_BITS_WITH)) - 1,
            },
            {
                "bus": "D",
                "num_width": TWO_BITS_WITH,
                "phase": 0,
                "label": "b",
                "signed": False,
                "number": int(math.pow(2, TWO_BITS_WITH)) - 1,
            },
        ],
        "mult2": [
            {
                "bus": "B",
                "num_width": TWO_BITS_WITH,
                "phase": 0,
                "label": "c",
                "signed": False,
                "number": int(math.pow(2, TWO_BITS_WITH)) - 1,
            },
            {
                "bus": "B",
                "num_width": TWO_BITS_WITH,
                "phase": 6,
                "label": "d",
                "signed": False,
                "number": int(math.pow(2, TWO_BITS_WITH)) - 1,
            },
        ],
    },
    {
        "name": "int7_22",
        "mult1": [
            {
                "bus": "A",
                "num_width": SEVEN_BITS_WIDTH,
                "phase": 22,
                "label": "a",
                "signed": False,
                "number": int(math.pow(2, SEVEN_BITS_WIDTH)) - 1,
            },
            {
                "bus": "D",
                "num_width": SEVEN_BITS_WIDTH,
                "phase": 0,
                "label": "b",
                "signed": False,
                "number": int(math.pow(2, SEVEN_BITS_WIDTH)) - 1,
            },
        ],
        "mult2": [
            {
                "bus": "B",
                "num_width": SEVEN_BITS_WIDTH,
                "phase": 0,
                "label": "c",
                "signed": False,
                "number": int(math.pow(2, SEVEN_BITS_WIDTH)) - 1,
            },
        ],
    },
    {
        "name": "int7_23",
        "mult1": [
            {
                "bus": "A",
                "num_width": SEVEN_BITS_WIDTH,
                "phase": 23,
                "label": "a",
                "signed": False,
                "number": int(math.pow(2, SEVEN_BITS_WIDTH)) - 1,
            },
            {
                "bus": "D",
                "num_width": SEVEN_BITS_WIDTH,
                "phase": 0,
                "label": "b",
                "signed": False,
                "number": int(math.pow(2, SEVEN_BITS_WIDTH)) - 1,
            },
        ],
        "mult2": [
            {
                "bus": "B",
                "num_width": SEVEN_BITS_WIDTH,
                "phase": 0,
                "label": "c",
                "signed": False,
                "number": int(math.pow(2, SEVEN_BITS_WIDTH)) - 1,
            },
        ],
    },
]
