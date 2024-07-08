(() => {
    const test = 1
    return {


        head: {
            text:
                ['tspan', { class: 'info h3' }, '3x3x1 matriz'],
        },

        "signal": [
            {
                "node": ".A...........B........C"
            },
            {
                "name": "clk",
                "wave": "P....................."
            },
            [
                "image provider",
                {
                    "name": "TVALID >",
                    "wave": "01....................",
                },
                {
                    "name": "TREADY <",
                    "wave": "0...1..............",
                },
                {
                    "name": "TLAST >",
                    "wave": "0...........10........",
                },
                {
                    "name": "TDATA >",
                    "wave": "x3...33333333333333333",
                    "data": "D<sub>0</sub>1 D<sub>0</sub>2 D<sub>0</sub>3 D<sub>0</sub>4 D<sub>0</sub>5 D<sub>0</sub>6 D<sub>0</sub>7 D<sub>0</sub>8 D<sub>0</sub>9 D<sub>1</sub>1 D<sub>1</sub>2 D<sub>1</sub>3 D<sub>1</sub>4 D<sub>1</sub>5 D<sub>1</sub>6 D<sub>1</sub>7 D<sub>1</sub>8 D<sub>1</sub>9"
                }
            ],
            {},
            [
                "kernel provider",
                {
                    "name": "TVALID >",
                    "wave": "0.1...................",
                },
                {
                    "name": "TREADY <",
                    "wave": "0...1.................",
                },
                {
                    "name": "TLAST >",
                    "wave": "0...........10........",
                },
                {
                    "name": "TDATA >",
                    "wave": "x.3..33333333333333333",
                    "data": "D<sub>0</sub>1 D<sub>0</sub>2 D<sub>0</sub>3 D<sub>0</sub>4 D<sub>0</sub>5 D<sub>0</sub>6 D<sub>0</sub>7 D<sub>0</sub>8 D<sub>0</sub>9 D<sub>1</sub>1 D<sub>1</sub>2 D<sub>1</sub>3 D<sub>1</sub>4 D<sub>1</sub>5 D<sub>1</sub>6 D<sub>1</sub>7 D<sub>1</sub>8 D<sub>1</sub>9"
                }
            ],
            {},
            [
                "bias provider",
                {
                    "name": "TVALID >",
                    "wave": "0..1.0.......10.......",
                },
                {
                    "name": "TREADY <",
                    "wave": "0...10.......10.......",
                },
                {
                    "name": "TDATA >",
                    "wave": "x..3.3........3.......",
                    "data": "bias<sub>0</sub> bias<sub>1</sub> bias<sub>2</sub>"
                }
            ],
            {},
            [
                "core",
                {
                    "name": "TVALID >",
                    "wave": "0.............10.",
                },
                {
                    "name": "TREADY <",
                    "wave": "1...............",
                },
                {
                    "name": "TDATA >",
                    "wave": "x.............3x",
                    "data": "ACC"
                },
                [
                    "internal signals",
                    {
                        "name": "mul",
                        "wave": "x5...55555555555555555",
                        "data": "D<sub>0</sub>1 D<sub>0</sub>2 D<sub>0</sub>3 D<sub>0</sub>4 D<sub>0</sub>5 D<sub>0</sub>6 D<sub>0</sub>7 D<sub>0</sub>8 D<sub>0</sub>9 D<sub>1</sub>1 D<sub>1</sub>2 D<sub>1</sub>3 D<sub>1</sub>4 D<sub>1</sub>5 D<sub>1</sub>6 D<sub>1</sub>7 D<sub>1</sub>8 D<sub>1</sub>9"
                    },
                    {
                        "name": "a",
                        "wave": "x....55555555555555555",
                        "data": "D<sub>0</sub>1 D<sub>0</sub>2 D<sub>0</sub>3 D<sub>0</sub>4 D<sub>0</sub>5 D<sub>0</sub>6 D<sub>0</sub>7 D<sub>0</sub>8 D<sub>0</sub>9 D<sub>1</sub>1 D<sub>1</sub>2 D<sub>1</sub>3 D<sub>1</sub>4 D<sub>1</sub>5 D<sub>1</sub>6 D<sub>1</sub>7 D<sub>1</sub>8 D<sub>1</sub>9"
                    },
                    {
                        "name": "state",
                        "wave": "7...777777777777777",
                        "data": "S0 S1 S2 S2 S2 S2 S2 S2 S2 S2 S3 S4 S2 S2 S2"
                    },
                    {
                        "name": "m_enable",
                        "wave": "0...10.......10."
                    }
                ]
            ],
        ],
        "config": {
            "hscale": 1,
            "title": "ss"
        },
        "edge": [
            "A+B cycle",
            "B+C cycle"
        ],

    }
})()