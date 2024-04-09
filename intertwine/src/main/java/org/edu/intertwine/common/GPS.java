package org.edu.intertwine.common;

import java.io.File;
import java.io.IOException;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.GpsDirectory;

public class GPS {
		// 위도 경도 추출용
		public double[] getGPS(String filePath) throws ImageProcessingException, IOException {
		    // 파일 경로를 스트링으로 받음
		    File file = new File(filePath);

		    Metadata metadata = ImageMetadataReader.readMetadata(file);
		    GpsDirectory gpsDirectory = metadata.getFirstDirectoryOfType(GpsDirectory.class);

		    if (gpsDirectory != null && gpsDirectory.containsTag(GpsDirectory.TAG_LATITUDE) && gpsDirectory.containsTag(GpsDirectory.TAG_LONGITUDE)) {
		       //위도 경도 double에 담음
		        double lat = gpsDirectory.getGeoLocation().getLatitude();
		        double lon = gpsDirectory.getGeoLocation().getLongitude();

		        return new double[] { lat, lon };
		    } else {
		    	return null;
		    }
			
		}
		
		
}
