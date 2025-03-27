package com.finviz.tests;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;

import java.time.Duration;

public class TestBase {

    static WebDriver driver;

    JavascriptExecutor js;

    @BeforeMethod
    public void init() {
        driver = new ChromeDriver();//Инициализируем хромдрайвер
        //driver.get("https://finviz.com/screener.ashx?v=111&f=idx_sp500&r=");Открываем наш сайт
        driver.get("https://finviz.com/screener.ashx");//Открываем наш сайт, уже со скринерем
        driver.manage().window().maximize();//Разворачиваем окно браузера в полный экран
        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(20));
    }

    @AfterMethod(enabled = true)//браузер закрываем - true, если false, то НЕ закрываем
    public void tearDown() {
        driver.quit();
    }//quit-закрывает браузер, close-закрывает текущую вкладку

    public void pause(int millis) {
        try {
            Thread.sleep(millis);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    public void click(WebElement element) {
        element.click();
    }

    public void clickWithJS(WebElement element, int x, int y) {//скролим окно, а потом кликаем
        js.executeScript("window.scrollBy(" + x +"," + y + ")");
        click(element);
    }
}
