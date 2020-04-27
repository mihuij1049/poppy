package kr.co.poppy.helper;

import java.io.IOException;

import lombok.extern.slf4j.Slf4j;
import okhttp3.Headers;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.logging.HttpLoggingInterceptor;
import okhttp3.logging.HttpLoggingInterceptor.Level;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

@Slf4j
public class RetrofitHelper {
	// ---- 싱글톤 생성 시작 ----
	private static RetrofitHelper current;
	
	public static RetrofitHelper getInstance() {
		if (current == null) {
			current = new RetrofitHelper();
		}
		
		return current;
	}
	
	public static void freeInstance() {
		current = null;
	}
	
	private RetrofitHelper() {
	}
	// ---- 싱글톤 생성 끝 ----
	
	/**
	 * Retrofit 객체를 생성하고 기본 설정들을 적용한 후 리턴한다.
	 * 
	 * @param baseUrl - 접근하고자 하는 API의 기본 주소 (ex: http://도메인)
	 * @return Retrofit 객체
	 */
	// --> import retrofit2.Retrofit;
	public Retrofit getRetrofit(String baseUrl) {
		// 통신 객체를 생성하기 위한 Builder 객체 정의 --> import okHttpClient;
		OkHttpClient.Builder httpClientBuilder = new OkHttpClient.Builder();
		
		// 통신객체에 Log 기록 객체를 연결한다.
		// -> import okhttp3.Logging.HttpLoggingInterceptor;
		HttpLoggingInterceptor logging = new HttpLoggingInterceptor(new MyLogger());
		logging.level(Level.BODY);
		httpClientBuilder.addInterceptor(logging);
		
		// MyInterceptor 클래스의 객체를 통신 객체에 연결한다.
		httpClientBuilder.addNetworkInterceptor(new MyInerceptor());
		
		// Builder를 통해 통신객체 생성 -> import okhttp3.okHttpClient;
		OkHttpClient httpClient = httpClientBuilder.build();
		
		// Retrofit을 생성하는 기능을 수행하는 객체를 정의한다.
		Retrofit.Builder builder = new Retrofit.Builder();
		
		// 기본 주소를 지정한다.
		builder.baseUrl(baseUrl);
		
		// 통신 결과를 Gson 객체를 통해 처리하도록 Gson을 연결한다. --> JSON 파싱 자동화
		// -> import retrofit2.converter.gson.GsonConverterFactory;
		builder.addConverterFactory(GsonConverterFactory.create());
		
		// 통신객체를 연결한다.
		builder.client(httpClient);
		
		// 모든 설정이 반영된 Retrofit 객체 생성 -> import retrofit2.Retrofit;
		Retrofit retrofit = builder.build();
		
		// 결과를 리턴
		return retrofit;
	}
	
	/**
	 * Log4j 객체를 통해 로그를 기록하도록 하는 메서드를 구현하는 클래스 정의
	 * Retrofit이 이 클래스의 객체를 통해 통신 과정을 의미하는 문자열을 
	 * Log() 메서드로 전달한다.
	 */
	// -> import okhttp3.Logging.HttpLoggingInterceptor
	public class MyLogger implements HttpLoggingInterceptor.Logger {
		@Override
		public void log(String logMessage) {
			// 전달받은 문자열을 로그로 저장한다.
			// -> 통신과정이 기록된다.
			log.debug(logMessage);
		}
	}
	
	/** 
	 * 통신 절차를 가로채서 보조적인 처리를 수행하는 클래스 정의.
	 * 이 클래스가 통신 정보에 HTTP 헤더를 강제로 추가하는 기능을 수행한다.
	 * 이 클래스의 객체를 통신 객체에 연결해야 한다.
	 */
	// -> import okhttp3.Interceptor;
	public class MyInerceptor implements Interceptor {
		// -> import okhttp3.Response
		@Override
		public Response intercept(Chain chain) throws IOException {
			Request originalRequest = chain.request();
			Request.Builder builder = originalRequest.newBuilder();
			builder.removeHeader("User-Agent");
			
			// 임의의 웹 브라우저 정보로 설정 (ex: 크롬)
			builder.header("User-Agent", 
					"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36");
					
			Request newRequest = builder.build();
			Headers headers = newRequest.headers();
			
			for (int i=0; i < headers.size(); i++) {
				String name = headers.name(i);
				String values = headers.get(name);
				log.debug("(H) -> " + name + ": " + values); 
			}
			
			return chain.proceed(newRequest);
		}
	}
}


