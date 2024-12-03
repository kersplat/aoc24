using System.Text.RegularExpressions;

try
{
    using StreamReader reader = new("../../../input.txt");
    var memory = reader.ReadToEnd();

    var rx = @"mul\((\d{1,3}),(\d{1,3})\)|(do\(\))|(don't\(\))";
    var isEnabled = true;
    var sum = 0;

    foreach (Match x in Regex.Matches(memory, rx))
    {
        switch (x.Value)
        {
            case "do()":
                isEnabled = true;
                continue;
            case "don't()":
                isEnabled = false;
                break;
        }

        if (isEnabled)
        {
            var a = int.Parse(x.Groups[1].Value);
            var b = int.Parse(x.Groups[2].Value);
            var product = a * b;
            sum += product;
            Console.WriteLine($"{a} * {b} = {product} sum: {sum}");
        }
    }
}
catch (IOException e)
{
    Console.WriteLine(e);
}