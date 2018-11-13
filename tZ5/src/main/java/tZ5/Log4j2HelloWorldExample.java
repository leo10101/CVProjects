package tZ5;

import java.util.concurrent.TimeUnit;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Log4j2HelloWorldExample {
	private static final Logger LOGGER = LogManager.getLogger(Log4j2HelloWorldExample.class.getName());

	public static void main(String[] args) throws InterruptedException {
		for (int i = 0; i < 500000; i++) {
			String formatted = String.format("%05d", i);
			TimeUnit.SECONDS.sleep(1);
			// System.out.print(formatted);
			LOGGER.info(formatted);
		}
	}
}