Gamma =
    replaceClass: (e, regex, c) ->
        e.className = e.className.replace regex, c

    RGBA:
        toArray: (s) ->
            vals = s.match /\.?\d+\.?\d*/g
            vals[i] = parseInt vals[i], 10 for i in [0..2]
            vals[3] = parseFloat vals[3]
            vals
        toString: (xs) ->
            "rgba(#{xs.join ','})"
        fromRGB: (rgb, opacity=1) ->
            vals = s.match /\.?\d+\.?\d*/g
            "rgba(#{vals[0]},#{vals[1]},#{vals[2]},#{opacity})"
        fromHex: (hex, opacity=1) ->
            rgb = (hex.replace '#', '').match /(.{2})/g
            for i in [0...3]
                rgb[i] = parseInt rgb[i], 16
            return "rgba(#{rgb.join ', '}, #{opacity})";

    namespace: (target, name, block) ->
        [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
        top    = target
        target = target[item] or= {} for item in name.split '.'
        block target, top

window.Gamma = Gamma
