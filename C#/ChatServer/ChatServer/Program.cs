// See https://aka.ms/new-console-template for more information

using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;

String? name;

String url;
String urlParameter;

HttpClient client;

bool start(){

    Console.WriteLine("What is your name?");

    name = Console.ReadLine();

    if (name == null)
        return false;

    Console.WriteLine("Write Text");

    urlParameter = "File=test.json&Name=" + name + "&Text=" + Console.ReadLine() + "&TimeStamp=" + DateTime.Now;
    url = "http://127.0.0.1/WriteFile.php?" + urlParameter;

    Console.WriteLine(url);

    client = new HttpClient();
    client.BaseAddress = new Uri(url);
    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

    HttpResponseMessage response = client.GetAsync("").Result;
    if (response.IsSuccessStatusCode) {
        var products = response.Content.ReadAsStringAsync().Result;
        //zConsole.WriteLine(products);
    }
    else {
        Console.WriteLine("{0} ({1})", (int)response.StatusCode, response.ReasonPhrase);
    }

    return true;
}

void loop()
{
    //Console.WriteLine("Write Text");

    //urlParameter = "File=test.json&Name=" + name + "&Text=" + Console.ReadLine() + "&TimeStamp=" + DateTime.Now;
    //url = "http://127.0.0.1/WriteFile.php?" + urlParameter;

    //Console.WriteLine(url);


}


if (start()) while (true){ loop();Thread.Sleep(1000); }