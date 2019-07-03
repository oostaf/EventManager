package service;

import model.Event;
import model.Location;
import org.apache.commons.lang3.RandomStringUtils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

public class CreateManyEvents {

    public static void main(String[] args) {
        EventService eventService = new EventServiceImp();
        for (int i = 0; i < 20; i++) {
            Event event = new Event();
            event.setName(generateRandomEventName());
            event.setDescription(generateRandomEventDescription());
            event.setCost(Double.parseDouble(generateRandomEventPrice()));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy HH:mm");
            LocalDateTime formatDateTime = LocalDateTime.parse("06-25-2020 16:00", formatter);
            event.setDate(formatDateTime);
            Random random = new Random();
            Location location = new Location();
            location.setId(random.nextInt((34 - 19) + 1) + 19);
            event.setLocation(location);
            eventService.addEvent(event);
        }

    }

    private static String generateRandomEventName() {
        return RandomStringUtils.randomAlphabetic(10) + " " + RandomStringUtils.randomAlphabetic(9);
    }

    private static String generateRandomEventDescription() {
        return RandomStringUtils.randomAlphabetic(10) + " " + RandomStringUtils.randomAlphabetic(9) + " " + RandomStringUtils.randomAlphabetic(10);
    }

    private static String generateRandomEventPrice() {
        return RandomStringUtils.randomNumeric(3);
    }

}
