open System.IO

let rulesInput = ResizeArray<string>()
let updates = ResizeArray<string>()

File.ReadLines("../../../test.txt")
//File.ReadLines("../../../input.txt")
|> List.ofSeq
|> List.map (fun line ->
    match line with
    | line when line.Length < 3 -> ()
    | line when line[2] = '|' -> rulesInput.Add(line)
    | line when line[2] = ',' -> updates.Add(line)
    | _ -> ())
|> ignore

let invertRule (rule: string) = rule[3..4] + "|" + rule[0..1]

let rec transformUpdate update =
    match update with
    | [] -> []
    | x :: xs ->
        let pairs = xs |> List.map (fun y -> $"{x}|{y}")
        pairs @ transformUpdate xs

let rules =
    rulesInput.ToArray()
    |> Array.toList
    |> List.map (fun rule -> (rule, "allowed", invertRule rule, "prohibited"))
    |> List.collect (fun (r1, v1, r2, v2) -> [ (r1, v1); (r2, v2) ])
    |> Map.ofList

// Three possiblilities: found and allowed, found and prohibited, not found therefore allowed
let evalUpdate (update: string list) =
    update
    |> List.map (fun x -> Map.tryFind x rules)
    |> List.map (fun x ->
        match x with
        | Some x -> x
        | None -> "allowed")

let checksum =
    updates.ToArray()
    |> Array.toList
    |> List.map _.Split(',')
    |> List.map (fun update -> update |> Array.toList |> transformUpdate)
    |> List.map evalUpdate
    |> List.mapi (fun index update -> (index, not (List.contains "prohibited" update)))
    |> List.filter (fun (_, update) -> update = true)
    |> List.map (fun (index, _) -> updates[index])
    |> List.map _.Split(',')
    |> List.map (fun update -> update[update.Length / 2])
    |> List.map int
    |> List.sum

printfn $"{checksum}"
