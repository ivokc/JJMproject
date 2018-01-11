package com.jjmproject.vendors.http;

import com.android.volley.AuthFailureError;
import com.android.volley.Header;
import com.android.volley.Request;
import com.android.volley.toolbox.BaseHttpStack;
import com.android.volley.toolbox.HttpResponse;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import okhttp3.Headers;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.RequestBody;
import okhttp3.Response;

/**
 * package: com.jjmproject.vendors.http
 * author: ivokc
 * email: jijm@bosc.cn
 * github: https://github.com/ivokc
 * date: 2018/1/9
 * desc:
 */

public class OkHttpStack extends BaseHttpStack {

    private static final int HTTP_CONTINUE = 100;


    private final OkHttpClient mClient;//提供的可以克隆的OkHttpClient，例如HTTPS请求

    public static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");

    public OkHttpStack(OkHttpClient client) {
        this.mClient = client;
    }

    public OkHttpStack() {
        this(new OkHttpClient());
    }

    /*
            封装okhttp请求
         */
    @Override
    public HttpResponse executeRequest(Request<?> request, Map<String, String> additionalHeaders) throws IOException, AuthFailureError {
        String url = request.getUrl();
        HashMap<String, String> map = new HashMap<>();
        map.putAll(request.getHeaders());
        map.putAll(additionalHeaders);

        int timeoutMs = request.getTimeoutMs();
        OkHttpClient client = mClient.newBuilder()
                .readTimeout(timeoutMs,TimeUnit.MILLISECONDS)
                .connectTimeout(timeoutMs, TimeUnit.MILLISECONDS)
                .writeTimeout(timeoutMs, TimeUnit.MILLISECONDS)
                .build();
        okhttp3.Request.Builder okHttpRequestBuilder = new okhttp3.Request.Builder();
        //添加请求头
        for (String headerName : map.keySet()) {
            okHttpRequestBuilder.addHeader(headerName, map.get(headerName));
        }
        //添加请求体
        setConnectionParametersForRequest(okHttpRequestBuilder, request);

        okhttp3.Request okhttp3Request = okHttpRequestBuilder.
                url(url).
                build();
        //发送请求
        Response okhttp3response = client.newCall(okhttp3Request).execute();
        //获取返回码
        int responseCode = okhttp3response.code();
        if (responseCode == -1) {
            // -1 is returned by getResponseCode() if the response code could not be retrieved.
            // Signal to the caller that something was wrong with the connection.
            throw new IOException("Could not retrieve response code from HttpUrlConnection.");
        }

        if (!hasResponseBody(request.getMethod(), responseCode)) {
            return new HttpResponse(responseCode, convertHeaders(okhttp3response.headers().toMultimap()));
        }

        return new HttpResponse(responseCode, convertHeaders(okhttp3response.headers().toMultimap()),(int)okhttp3response.body().contentLength(),
                inputStreamFromConnection(okhttp3response));

    }


    // VisibleForTesting
    static List<Header> convertHeaders(Map<String, List<String>> responseHeaders) {
        List<Header> headerList = new ArrayList<>(responseHeaders.size());
        for (Map.Entry<String, List<String>> entry : responseHeaders.entrySet()) {
            // HttpUrlConnection includes the status line as a header with a null key; omit it here
            // since it's not really a header and the rest of Volley assumes non-null keys.
            if (entry.getKey() != null) {
                for (String value : entry.getValue()) {
                    headerList.add(new Header(entry.getKey(), value));
                }
            }
        }
        return headerList;
    }


    /**
     * Initializes an {@link InputStream} from the given {@link HttpURLConnection}.
     * @param response
     * @return an HttpEntity populated with data from <code>connection</code>.
     */
    private static InputStream inputStreamFromConnection(Response response) {
        InputStream inputStream;
        inputStream = response.body().byteStream();
        return inputStream;
    }
    /**
     * Checks if a response message contains a body.
     * @see <a href="https://tools.ietf.org/html/rfc7230#section-3.3">RFC 7230 section 3.3</a>
     * @param requestMethod request method
     * @param responseCode response status code
     * @return whether the response has a body
     */
    private static boolean hasResponseBody(int requestMethod, int responseCode) {
        return requestMethod != Request.Method.HEAD
                && !(HTTP_CONTINUE <= responseCode && responseCode < HttpURLConnection.HTTP_OK)
                && responseCode != HttpURLConnection.HTTP_NO_CONTENT
                && responseCode != HttpURLConnection.HTTP_NOT_MODIFIED;
    }


    private  void setConnectionParametersForRequest (okhttp3.Request.Builder builder, Request<?> request)
            throws IOException, AuthFailureError {
        switch (request.getMethod()) {
            case Request.Method.DEPRECATED_GET_OR_POST:
                byte[] postBody = request.getPostBody();
                if (postBody != null) {
                    builder.post(RequestBody.create(JSON, postBody));
                }
                break;

            case Request.Method.GET:
                builder.get();
                break;

            case Request.Method.DELETE:
                builder.delete();
                break;

            case Request.Method.POST:
                builder.post(addBodyIfExists(request));
                break;

            case Request.Method.PUT:
                builder.put(addBodyIfExists(request));
                break;

            case Request.Method.HEAD:
                builder.head();
                break;

            case Request.Method.OPTIONS:
                builder.method("OPTIONS", null);
                break;

            case Request.Method.TRACE:
                builder.method("TRACE", null);
                break;

            case Request.Method.PATCH:
                builder.patch(addBodyIfExists(request));
                break;

            default:
                throw new IllegalStateException("Unknown method type.");
        }
    }
    private static RequestBody addBodyIfExists( Request<?> request)throws IOException, AuthFailureError {
        byte[] body = request.getBody();
        if (body == null) {
            return null;
        }
        return RequestBody.create(JSON, body);
    }









}
