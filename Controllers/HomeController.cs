using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using frdgr5.Models;

namespace frdgr5.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
}
