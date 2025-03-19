package com.finviz.pages;

import com.google.common.io.Files;
import org.openqa.selenium.*;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.support.PageFactory;

import java.io.File;
import java.io.IOException;

public abstract class BasePage {

    private String timeOfData; // В какое время загружаются данные

    public WebDriver driver;

    JavascriptExecutor js;

    public BasePage(WebDriver driver) {
        this.driver = driver;
        PageFactory.initElements(driver, this);
        js = (JavascriptExecutor) driver;
    }

    public BasePage() {
    }

    public String getTimeOfData() {
        return timeOfData;
    }

    public void setTimeOfData(String timeOfData) {
        this.timeOfData = timeOfData;
    }

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

    public String makeScreen() {//Делаем скрин-шот и сохраняем его в папке по указанному пути в формате png
        File tmp = ((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
        File screenshot = new File("screenshots/screen_" + System.currentTimeMillis() + ".png");

        try {
            Files.copy(tmp, screenshot);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return screenshot.getAbsolutePath();
    }
}
